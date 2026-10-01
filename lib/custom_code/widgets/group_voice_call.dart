// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:universal_html/html.dart' as html;
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupVoiceCall extends StatefulWidget {
  const GroupVoiceCall({
    super.key,
    this.width,
    this.height,
    required this.groupId,
    required this.userIds,
  });

  final double? width;
  final double? height;
  final String groupId;
  final List<String> userIds;

  @override
  State<GroupVoiceCall> createState() => _GroupVoiceCallState();
}

class _GroupVoiceCallState extends State<GroupVoiceCall> {
  final JitsiMeet _jitsiMeet = JitsiMeet();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = true;
  bool _showStartButton = false;
  String _errorMessage = "";
  bool _hasError = false;
  bool _isInCall = false;
  String _callId = '';
  DateTime? _callStartTime;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      setUrlStrategy(PathUrlStrategy());
      _checkAndRequestPermissions();
    } else {
      _startCall();
    }
  }

  Future<void> _checkAndRequestPermissions() async {
    try {
      // Safely check secure context
      final isSecure = html.window.isSecureContext ?? false;

      if (!isSecure) {
        throw Exception('Page must be served over HTTPS for microphone access');
      }

      // For web, we need to trigger permission through user gesture
      // Show a button that will start the call when clicked

      // Check if permissions API is available
      if (html.window.navigator.permissions == null) {
        throw Exception('Permissions API not available in this browser');
      }

      setState(() {
        _isLoading = false;
        _showStartButton = true;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _startWebCall() async {
    setState(() {
      _isLoading = true;
      _showStartButton = false;
    });

    try {
      // For web, we need to request microphone access separately
      final status = await html.window.navigator.permissions
          ?.query({'name': 'microphone'});
      if (status?.state == 'denied') {
        throw Exception('Microphone permission denied');
      }

      // Proceed with call setup
      await _startCall();
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _startCall() async {
    try {
      // 1. Request microphone permission
      final permissionStatus = await Permission.microphone.request();
      if (!permissionStatus.isGranted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
        return;
      }

      // 2. Generate unique call ID
      _callId = 'call_${DateTime.now().millisecondsSinceEpoch}';
      _callStartTime = DateTime.now();

      // 3. Update Firestore with call status
      await _updateCallStatus(true);

      // 4. Configure Jitsi options
      final user = _auth.currentUser;
      final options = JitsiMeetConferenceOptions(
        room: '${widget.groupId}_$_callId',
        configOverrides: {
          "startWithAudioMuted": false,
          "startWithVideoMuted": true,
        },
        featureFlags: {
          FeatureFlags.videoMuteEnabled: true,
          FeatureFlags.iosScreenSharingEnabled: false,
          FeatureFlags.androidScreenSharingEnabled: false,
          FeatureFlags.welcomePageEnabled: false,
          FeatureFlags.chatEnabled: false,
        },
        userInfo: JitsiMeetUserInfo(
            displayName: user?.displayName ?? 'Participant',
            email: user?.email ?? 'no email set',
            avatar: user?.photoURL ??
                "https://avatars.githubusercontent.com/u/57035818?s=400&u=02572f10fe61bca6fc20426548f3920d53f79693&v=4"),
      );

      // 5. Notify participants
      await _notifyParticipants();

      // 6. Join the meeting
      await _jitsiMeet.join(options);

      setState(() {
        _isLoading = false;
        _isInCall = true;
      });
    } catch (e) {
      debugPrint('Error starting call: $e');
      await _endCall(error: e.toString());
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Future<void> _updateCallStatus(bool inCall) async {
    final user = _auth.currentUser;
    if (user == null) return;

    // Update group call status
    await _firestore.collection('groupChats').doc(widget.groupId).update({
      'active_call': inCall
          ? {
              'call_id': _callId,
              'started_at': _callStartTime,
              'initiator': user.uid,
            }
          : FieldValue.delete(),
    });

    // Update user status
    await _firestore.collection('users').doc(user.uid).update({
      'in_call': inCall,
      'current_call': inCall ? _callId : FieldValue.delete(),
    });
  }

  Future<void> _notifyParticipants() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final batch = _firestore.batch();

    // Create call history document
    final callRef = _firestore.collection('call_history').doc(_callId);
    batch.set(callRef, {
      'call_id': _callId,
      'participants': widget.userIds,
      'start_time': _callStartTime,
      'call_type': 'voice',
      'group_id': widget.groupId,
      'initiator': user.uid,
      'status': 'ongoing',
    });

    // Add participants to call_participants subcollection
    for (final participantId in widget.userIds) {
      final participantRef =
          callRef.collection('call_participants').doc(participantId);
      batch.set(participantRef, {
        'user_id': participantId,
        'join_time': participantId == user.uid ? _callStartTime : null,
        'status': participantId == user.uid ? 'joined' : 'notified',
      });
    }

    await batch.commit();
  }

  Future<void> _endCall({String? error}) async {
    try {
      // Close Jitsi meeting
      await _jitsiMeet.closeChat();

      // Update call history
      final duration = _callStartTime != null
          ? DateTime.now().difference(_callStartTime!).inSeconds
          : 0;

      await _firestore.collection('call_history').doc(_callId).update({
        'end_time': DateTime.now(),
        'duration_seconds': duration,
        'status': error != null ? 'failed' : 'completed',
      });

      // Update participant who joined
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('call_history')
            .doc(_callId)
            .collection('call_participants')
            .doc(user.uid)
            .update({
          'leave_time': DateTime.now(),
          'duration_seconds': duration,
        });
      }

      // Clear active call status
      await _updateCallStatus(false);

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint('Error ending call: $e');
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Starting Call...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_hasError) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    if (_showStartButton) {
      return Scaffold(
        appBar: AppBar(title: Text('Start Voice Call')),
        body: Center(
          child: ElevatedButton(
            onPressed: _startWebCall,
            child: const Text('Start Voice Call'),
          ),
        ),
      );
    }

    // Jitsi handles its own UI when in call
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Call - ${widget.groupId}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_end),
            onPressed: _endCall,
            color: Colors.red,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.volume_up, size: 64),
            const SizedBox(height: 20),
            Text(
                'Active voice call with ${widget.userIds.length} participants'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _endCall,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child:
                  const Text('End Call', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_isInCall) {
      _endCall();
    }
    super.dispose();
  }
}
