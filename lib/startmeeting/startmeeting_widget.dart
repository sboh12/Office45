import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'startmeeting_model.dart';
export 'startmeeting_model.dart';

class StartmeetingWidget extends StatefulWidget {
  const StartmeetingWidget({
    super.key,
    required this.meetingName,
  });

  final String? meetingName;

  static String routeName = 'startmeeting';
  static String routePath = '/startmeeting';

  @override
  State<StartmeetingWidget> createState() => _StartmeetingWidgetState();
}

class _StartmeetingWidgetState extends State<StartmeetingWidget> {
  late StartmeetingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartmeetingModel());

    if (Platform.isAndroid || Platform.isIOS) {
      _initCamera();
    }
  }

  @override
  void dispose() {
    _model.dispose();

    _stopwatch.stop();
    _timer?.cancel();
    WakelockPlus.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent2,
          automaticallyImplyLeading: false,
          title: Text(
            'Start Meeting',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.robotoCondensed(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: FlutterFlowMuxBroadcast(
              isCameraInitialized: _isCameraInitialized,
              isStreaming: muxBroadcastIsLive,
              durationString: _durationString,
              borderRadius: BorderRadius.circular(0.0),
              controller: muxBroadcastController,
              videoConfig: _initialVideoConfig,
              onCameraRotateButtonTap: () async {
                await switchCamera();
                safeSetState(() => _isFrontCamSelected = !_isFrontCamSelected);
              },
              startButtonText: 'Start Stream',
              startButtonIcon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 24.0,
              ),
              startButtonOptions: FFButtonOptions(
                width: 160.0,
                height: 50.0,
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: Colors.white,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).titleSmallIsCustom,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              liveIcon: FaIcon(
                FontAwesomeIcons.solidCircle,
                color: Colors.red,
                size: 10.0,
              ),
              liveText: 'Live',
              liveTextStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.red,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).titleSmallIsCustom,
                  ),
              liveTextBackgroundColor: Color(0x8A000000),
              durationTextStyle: FlutterFlowTheme.of(context)
                  .titleSmall
                  .override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.red,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).titleSmallIsCustom,
                  ),
              durationTextBackgroundColor: Color(0x8A000000),
              liveContainerBorderRadius: BorderRadius.circular(8.0),
              durationContainerBorderRadius: BorderRadius.circular(8.0),
              rotateButtonColor: Color(0x8A000000),
              rotateButtonIcon: Icon(
                Icons.flip_camera_android,
                color: Colors.white,
                size: 24.0,
              ),
              stopButtonIcon: Icon(
                Icons.stop_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              stopButtonColor: Colors.red,
              onStartButtonTap: () async {
                await startStreaming();

                var broadcastRecordReference = BroadcastRecord.collection.doc();
                await broadcastRecordReference.set(createBroadcastRecordData(
                  islive: true,
                  name: widget!.meetingName,
                  url: muxBroadcastPlaybackUrl,
                  time: getCurrentTimestamp,
                ));
                _model.outputMeeting = BroadcastRecord.getDocumentFromData(
                    createBroadcastRecordData(
                      islive: true,
                      name: widget!.meetingName,
                      url: muxBroadcastPlaybackUrl,
                      time: getCurrentTimestamp,
                    ),
                    broadcastRecordReference);

                safeSetState(() {});
              },
              onStopButtonTap: () async {
                stopStreaming();

                await _model.outputMeeting!.reference
                    .update(createBroadcastRecordData(
                  islive: false,
                ));
                context.safePop();
              },
            ),
          ),
        ),
      ),
    );
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    safeSetState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        safeSetState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        safeSetState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        safeSetState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    final callName = 'createLiveStream';
    final response = await makeCloudCall(callName, {'latency_mode': 'low'});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        WakelockPlus.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      WakelockPlus.disable();
      liveStreamController.stopStreaming();
      safeSetState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      safeSetState(() {
        _durationString = _getDurationString(_stopwatch.elapsed);
      });
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
