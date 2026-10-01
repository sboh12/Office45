import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/logo-office45_(1)_(1).png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'DigitaOfficeSpace': ParameterData.none(),
  'Announcements': ParameterData.none(),
  'ListOfNotes': (data) async => ParameterData(
        allParams: {
          'subjectRef': getParameter<DocumentReference>(data, 'subjectRef'),
        },
      ),
  'GroupChats': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<String>(data, 'userProfile'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'chatUser': getParameter<DocumentReference>(data, 'chatUser'),
          'groupName': getParameter<String>(data, 'groupName'),
          'groupImage': getParameter<String>(data, 'groupImage'),
          'subjectInfo': getParameter<DocumentReference>(data, 'subjectInfo'),
        },
      ),
  'School': (data) async => ParameterData(
        allParams: {
          'schoolSelected':
              getParameter<DocumentReference>(data, 'schoolSelected'),
        },
      ),
  'editProfile': ParameterData.none(),
  'AddSchool': ParameterData.none(),
  'listSchools': ParameterData.none(),
  'profileSchool': (data) async => ParameterData(
        allParams: {
          'school': getParameter<DocumentReference>(data, 'school'),
        },
      ),
  'DashboardSchool': (data) async => ParameterData(
        allParams: {
          'schoolSelected':
              getParameter<DocumentReference>(data, 'schoolSelected'),
        },
      ),
  'DashboardSubject': (data) async => ParameterData(
        allParams: {
          'subjectSelected':
              getParameter<DocumentReference>(data, 'subjectSelected'),
          'schoolSubject':
              getParameter<DocumentReference>(data, 'schoolSubject'),
        },
      ),
  'AddEvents': ParameterData.none(),
  'AploadActivities': (data) async => ParameterData(
        allParams: {
          'subjectAdded': getParameter<DocumentReference>(data, 'subjectAdded'),
          'activityType': getParameter<String>(data, 'activityType'),
        },
      ),
  'OnlineChats': ParameterData.none(),
  'pdfView': (data) async => ParameterData(
        allParams: {
          'pdfLink': getParameter<String>(data, 'pdfLink'),
        },
      ),
  'ListOfActivities': (data) async => ParameterData(
        allParams: {
          'subjectRef': getParameter<DocumentReference>(data, 'subjectRef'),
        },
      ),
  'AdminDash': ParameterData.none(),
  'attemptTask': (data) async => ParameterData(
        allParams: {
          'activity': getParameter<DocumentReference>(data, 'activity'),
        },
      ),
  'subjectTasks': (data) async => ParameterData(
        allParams: {
          'subject': getParameter<DocumentReference>(data, 'subject'),
        },
      ),
  'addResources': (data) async => ParameterData(
        allParams: {
          'subject': getParameter<DocumentReference>(data, 'subject'),
        },
      ),
  'workingMaterial': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'memo': getParameter<String>(data, 'memo'),
        },
      ),
  'studentResults': ParameterData.none(),
  'calendR': ParameterData.none(),
  'DashboardTeacher': (data) async => ParameterData(
        allParams: {
          'subjectSelected':
              getParameter<DocumentReference>(data, 'subjectSelected'),
          'schoolSubject':
              getParameter<DocumentReference>(data, 'schoolSubject'),
        },
      ),
  'PrincipalDash': ParameterData.none(),
  'calendRTeacher': ParameterData.none(),
  'AploadNotes': (data) async => ParameterData(
        allParams: {
          'subjectAdded': getParameter<DocumentReference>(data, 'subjectAdded'),
        },
      ),
  'studentResultsAdded': (data) async => ParameterData(
        allParams: {
          'subjectSelected':
              getParameter<DocumentReference>(data, 'subjectSelected'),
          'activitySelected':
              getParameter<DocumentReference>(data, 'activitySelected'),
        },
      ),
  'openNotes': (data) async => ParameterData(
        allParams: {
          'noteSelected': getParameter<DocumentReference>(data, 'noteSelected'),
        },
      ),
  'EditSchool': (data) async => ParameterData(
        allParams: {
          'selectedSchool':
              getParameter<DocumentReference>(data, 'selectedSchool'),
        },
      ),
  'SchoolCode': (data) async => ParameterData(
        allParams: {
          'schoolURL': getParameter<DocumentReference>(data, 'schoolURL'),
        },
      ),
  'itemsSubjects': ParameterData.none(),
  'phoneAuth': ParameterData.none(),
  'usersList': (data) async => ParameterData(
        allParams: {
          'isTeacher': getParameter<bool>(data, 'isTeacher'),
          'searchName': getParameter<String>(data, 'searchName'),
        },
      ),
  'SingleChats': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<String>(data, 'userProfile'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'chatUser': getParameter<DocumentReference>(data, 'chatUser'),
          'groupName': getParameter<String>(data, 'groupName'),
          'groupImage': getParameter<String>(data, 'groupImage'),
          'subjectInfo': getParameter<DocumentReference>(data, 'subjectInfo'),
          'userb': getParameter<DocumentReference>(data, 'userb'),
        },
      ),
  'openWeb': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
        },
      ),
  'teacherResults': ParameterData.none(),
  'ListOfApplicants': ParameterData.none(),
  'SingleAIChat': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<String>(data, 'userProfile'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'chatUser': getParameter<DocumentReference>(data, 'chatUser'),
          'groupName': getParameter<String>(data, 'groupName'),
          'groupImage': getParameter<String>(data, 'groupImage'),
          'userb': getParameter<DocumentReference>(data, 'userb'),
        },
      ),
  'AddEventsVideo': ParameterData.none(),
  'VideoPlayerOffice45': ParameterData.none(),
  'AuthenticateCopy': ParameterData.none(),
  'newprofile': ParameterData.none(),
  'APScalculator': ParameterData.none(),
  'resultsfinal': ParameterData.none(),
  'newprofileUser': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'editPostSingle': (data) async => ParameterData(
        allParams: {
          'schoolEvent': getParameter<DocumentReference>(data, 'schoolEvent'),
        },
      ),
  'verificationAuth': ParameterData.none(),
  'PostsByUser': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<DocumentReference>(data, 'userName'),
        },
      ),
  'analysis': ParameterData.none(),
  'AnalysisPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'DigitalDataAnalysis': (data) async => ParameterData(
        allParams: {
          'teacher': getParameter<DocumentReference>(data, 'teacher'),
        },
      ),
  'SchoolDash': (data) async => ParameterData(
        allParams: {
          'school': getParameter<DocumentReference>(data, 'school'),
        },
      ),
  'sponsor': (data) async => ParameterData(
        allParams: {
          'announcements': getParameter<int>(data, 'announcements'),
          'notes': getParameter<int>(data, 'notes'),
          'activities': getParameter<int>(data, 'activities'),
          'resources': getParameter<int>(data, 'resources'),
          'videos': getParameter<int>(data, 'videos'),
          'school': getParameter<int>(data, 'school'),
          'messages': getParameter<int>(data, 'messages'),
          'users': getParameter<int>(data, 'users'),
        },
      ),
  'broadcastlisting': ParameterData.none(),
  'startmeeting': (data) async => ParameterData(
        allParams: {
          'meetingName': getParameter<String>(data, 'meetingName'),
        },
      ),
  'viewbroadcast': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
        },
      ),
  'Users': ParameterData.none(),
  'editProfileUsers': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
