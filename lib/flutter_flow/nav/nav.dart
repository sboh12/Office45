import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? ProfileWidget() : AuthenticateWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? ProfileWidget()
              : AuthenticateWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'DigitaOfficeSpace',
          path: '/digitaOfficeSpace',
          builder: (context, params) => DigitaOfficeSpaceWidget(),
        ),
        FFRoute(
          name: 'Announcements',
          path: '/announcements',
          builder: (context, params) => AnnouncementsWidget(),
        ),
        FFRoute(
          name: 'ListOfNotes',
          path: '/listOfNotes',
          builder: (context, params) => ListOfNotesWidget(
            subjectRef: params.getParam(
                'subjectRef', ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'GroupChats',
          path: '/groupChats',
          builder: (context, params) => GroupChatsWidget(
            userProfile: params.getParam('userProfile', ParamType.String),
            userRef: params.getParam(
                'userRef', ParamType.DocumentReference, false, ['users']),
            chatUser: params.getParam(
                'chatUser', ParamType.DocumentReference, false, ['groupChats']),
            groupName: params.getParam('groupName', ParamType.String),
            groupImage: params.getParam('groupImage', ParamType.String),
            subjectInfo: params.getParam('subjectInfo',
                ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'Authenticate',
          path: '/authenticate',
          builder: (context, params) => AuthenticateWidget(),
        ),
        FFRoute(
          name: 'School',
          path: '/school',
          builder: (context, params) => SchoolWidget(
            schoolSelected: params.getParam('schoolSelected',
                ParamType.DocumentReference, false, ['School']),
          ),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'AddSchool',
          path: '/addSchool',
          builder: (context, params) => AddSchoolWidget(),
        ),
        FFRoute(
          name: 'listSchools',
          path: '/listSchools',
          builder: (context, params) => ListSchoolsWidget(),
        ),
        FFRoute(
          name: 'profileSchool',
          path: '/profileSchool',
          builder: (context, params) => ProfileSchoolWidget(
            school: params.getParam(
                'school', ParamType.DocumentReference, false, ['School']),
          ),
        ),
        FFRoute(
          name: 'DashboardSchool',
          path: '/dashboardSchool',
          builder: (context, params) => DashboardSchoolWidget(
            schoolSelected: params.getParam('schoolSelected',
                ParamType.DocumentReference, false, ['School']),
          ),
        ),
        FFRoute(
          name: 'DashboardSubject',
          path: '/dashboardSubject',
          builder: (context, params) => DashboardSubjectWidget(
            subjectSelected: params.getParam('subjectSelected',
                ParamType.DocumentReference, false, ['Subjects']),
            schoolSubject: params.getParam('schoolSubject',
                ParamType.DocumentReference, false, ['School']),
          ),
        ),
        FFRoute(
          name: 'AddEvents',
          path: '/addEvents',
          builder: (context, params) => AddEventsWidget(),
        ),
        FFRoute(
          name: 'AploadActivities',
          path: '/aploadActivities',
          builder: (context, params) => AploadActivitiesWidget(
            subjectAdded: params.getParam('subjectAdded',
                ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'OnlineChats',
          path: '/onlineChats',
          builder: (context, params) => OnlineChatsWidget(),
        ),
        FFRoute(
          name: 'pdfView',
          path: '/pdfView',
          builder: (context, params) => PdfViewWidget(
            pdfLink: params.getParam('pdfLink', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ListOfActivities',
          path: '/listOfActivities',
          builder: (context, params) => ListOfActivitiesWidget(
            subjectRef: params.getParam(
                'subjectRef', ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'AdminDash',
          path: '/adminDash',
          builder: (context, params) => AdminDashWidget(),
        ),
        FFRoute(
          name: 'attemptTask',
          path: '/attemptTask',
          builder: (context, params) => AttemptTaskWidget(
            activity: params.getParam('activity', ParamType.DocumentReference,
                false, ['Subjects', 'Activity']),
          ),
        ),
        FFRoute(
          name: 'subjectTasks',
          path: '/subjectTasks',
          builder: (context, params) => SubjectTasksWidget(
            subject: params.getParam(
                'subject', ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'addResources',
          path: '/addResources',
          builder: (context, params) => AddResourcesWidget(
            subject: params.getParam(
                'subject', ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'workingMaterial',
          path: '/workingMaterial',
          builder: (context, params) => WorkingMaterialWidget(
            exam: params.getParam('exam', ParamType.String),
            memo: params.getParam('memo', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'studentResults',
          path: '/studentResults',
          builder: (context, params) => StudentResultsWidget(),
        ),
        FFRoute(
          name: 'calendR',
          path: '/calendR',
          builder: (context, params) => CalendRWidget(),
        ),
        FFRoute(
          name: 'DashboardTeacher',
          path: '/dashboardTeacher',
          builder: (context, params) => DashboardTeacherWidget(
            subjectSelected: params.getParam('subjectSelected',
                ParamType.DocumentReference, false, ['Subjects']),
            schoolSubject: params.getParam('schoolSubject',
                ParamType.DocumentReference, false, ['School']),
          ),
        ),
        FFRoute(
          name: 'PrincipalDash',
          path: '/principalDash',
          builder: (context, params) => PrincipalDashWidget(),
        ),
        FFRoute(
          name: 'calendRTeacher',
          path: '/calendRTeacher',
          builder: (context, params) => CalendRTeacherWidget(),
        ),
        FFRoute(
          name: 'AploadNotes',
          path: '/aploadNotes',
          builder: (context, params) => AploadNotesWidget(
            subjectAdded: params.getParam('subjectAdded',
                ParamType.DocumentReference, false, ['Subjects']),
          ),
        ),
        FFRoute(
          name: 'studentResultsAdded',
          path: '/studentResultsAdded',
          builder: (context, params) => StudentResultsAddedWidget(
            subjectSelected: params.getParam('subjectSelected',
                ParamType.DocumentReference, false, ['Subjects']),
            activitySelected: params.getParam('activitySelected',
                ParamType.DocumentReference, false, ['Subjects', 'Activity']),
          ),
        ),
        FFRoute(
          name: 'openNotes',
          path: '/openNotes',
          builder: (context, params) => OpenNotesWidget(
            noteSelected: params.getParam('noteSelected',
                ParamType.DocumentReference, false, ['Subjects', 'Notes']),
          ),
        ),
        FFRoute(
          name: 'profilePage',
          path: '/profilePage',
          builder: (context, params) => ProfilePageWidget(
            profile: params.getParam(
                'profile', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'EditSchool',
          path: '/editSchool',
          builder: (context, params) => EditSchoolWidget(
            selectedSchool: params.getParam('selectedSchool',
                ParamType.DocumentReference, false, ['School']),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/authenticate';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).white,
                  child: Image.asset(
                    'assets/images/logo-office45.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
