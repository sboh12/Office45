import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? AnnouncementsWidget()
          : AuthenticateCopyWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? AnnouncementsWidget()
              : AuthenticateCopyWidget(),
        ),
        FFRoute(
          name: DigitaOfficeSpaceWidget.routeName,
          path: DigitaOfficeSpaceWidget.routePath,
          builder: (context, params) => DigitaOfficeSpaceWidget(),
        ),
        FFRoute(
          name: AnnouncementsWidget.routeName,
          path: AnnouncementsWidget.routePath,
          builder: (context, params) => AnnouncementsWidget(),
        ),
        FFRoute(
          name: ListOfNotesWidget.routeName,
          path: ListOfNotesWidget.routePath,
          builder: (context, params) => ListOfNotesWidget(
            subjectRef: params.getParam(
              'subjectRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
          ),
        ),
        FFRoute(
          name: GroupChatsWidget.routeName,
          path: GroupChatsWidget.routePath,
          builder: (context, params) => GroupChatsWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.String,
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            chatUser: params.getParam(
              'chatUser',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['groupChats'],
            ),
            groupName: params.getParam(
              'groupName',
              ParamType.String,
            ),
            groupImage: params.getParam(
              'groupImage',
              ParamType.String,
            ),
            subjectInfo: params.getParam(
              'subjectInfo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
          ),
        ),
        FFRoute(
          name: SchoolWidget.routeName,
          path: SchoolWidget.routePath,
          builder: (context, params) => SchoolWidget(
            schoolSelected: params.getParam(
              'schoolSelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: AddSchoolWidget.routeName,
          path: AddSchoolWidget.routePath,
          builder: (context, params) => AddSchoolWidget(),
        ),
        FFRoute(
          name: ListSchoolsWidget.routeName,
          path: ListSchoolsWidget.routePath,
          builder: (context, params) => ListSchoolsWidget(),
        ),
        FFRoute(
          name: ProfileSchoolWidget.routeName,
          path: ProfileSchoolWidget.routePath,
          builder: (context, params) => ProfileSchoolWidget(
            school: params.getParam(
              'school',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: DashboardSchoolWidget.routeName,
          path: DashboardSchoolWidget.routePath,
          builder: (context, params) => DashboardSchoolWidget(
            schoolSelected: params.getParam(
              'schoolSelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: DashboardSubjectWidget.routeName,
          path: DashboardSubjectWidget.routePath,
          builder: (context, params) => DashboardSubjectWidget(
            subjectSelected: params.getParam(
              'subjectSelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
            schoolSubject: params.getParam(
              'schoolSubject',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: AddEventsWidget.routeName,
          path: AddEventsWidget.routePath,
          builder: (context, params) => AddEventsWidget(),
        ),
        FFRoute(
          name: AploadActivitiesWidget.routeName,
          path: AploadActivitiesWidget.routePath,
          builder: (context, params) => AploadActivitiesWidget(
            subjectAdded: params.getParam(
              'subjectAdded',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
            activityType: params.getParam(
              'activityType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: OnlineChatsWidget.routeName,
          path: OnlineChatsWidget.routePath,
          builder: (context, params) => OnlineChatsWidget(),
        ),
        FFRoute(
          name: PdfViewWidget.routeName,
          path: PdfViewWidget.routePath,
          builder: (context, params) => PdfViewWidget(
            pdfLink: params.getParam(
              'pdfLink',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ListOfActivitiesWidget.routeName,
          path: ListOfActivitiesWidget.routePath,
          builder: (context, params) => ListOfActivitiesWidget(
            subjectRef: params.getParam(
              'subjectRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
          ),
        ),
        FFRoute(
          name: AdminDashWidget.routeName,
          path: AdminDashWidget.routePath,
          builder: (context, params) => AdminDashWidget(),
        ),
        FFRoute(
          name: AttemptTaskWidget.routeName,
          path: AttemptTaskWidget.routePath,
          builder: (context, params) => AttemptTaskWidget(
            activity: params.getParam(
              'activity',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects', 'Activity'],
            ),
          ),
        ),
        FFRoute(
          name: SubjectTasksWidget.routeName,
          path: SubjectTasksWidget.routePath,
          builder: (context, params) => SubjectTasksWidget(
            subject: params.getParam(
              'subject',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
          ),
        ),
        FFRoute(
          name: AddResourcesWidget.routeName,
          path: AddResourcesWidget.routePath,
          builder: (context, params) => AddResourcesWidget(
            subject: params.getParam(
              'subject',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
          ),
        ),
        FFRoute(
          name: WorkingMaterialWidget.routeName,
          path: WorkingMaterialWidget.routePath,
          builder: (context, params) => WorkingMaterialWidget(
            exam: params.getParam(
              'exam',
              ParamType.String,
            ),
            memo: params.getParam(
              'memo',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StudentResultsWidget.routeName,
          path: StudentResultsWidget.routePath,
          builder: (context, params) => StudentResultsWidget(),
        ),
        FFRoute(
          name: CalendRWidget.routeName,
          path: CalendRWidget.routePath,
          builder: (context, params) => CalendRWidget(),
        ),
        FFRoute(
          name: DashboardTeacherWidget.routeName,
          path: DashboardTeacherWidget.routePath,
          builder: (context, params) => DashboardTeacherWidget(
            subjectSelected: params.getParam(
              'subjectSelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
            schoolSubject: params.getParam(
              'schoolSubject',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: PrincipalDashWidget.routeName,
          path: PrincipalDashWidget.routePath,
          builder: (context, params) => PrincipalDashWidget(),
        ),
        FFRoute(
          name: CalendRTeacherWidget.routeName,
          path: CalendRTeacherWidget.routePath,
          builder: (context, params) => CalendRTeacherWidget(),
        ),
        FFRoute(
          name: AploadNotesWidget.routeName,
          path: AploadNotesWidget.routePath,
          builder: (context, params) => AploadNotesWidget(
            subjectAdded: params.getParam(
              'subjectAdded',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
          ),
        ),
        FFRoute(
          name: StudentResultsAddedWidget.routeName,
          path: StudentResultsAddedWidget.routePath,
          builder: (context, params) => StudentResultsAddedWidget(
            subjectSelected: params.getParam(
              'subjectSelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
            activitySelected: params.getParam(
              'activitySelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects', 'Activity'],
            ),
          ),
        ),
        FFRoute(
          name: OpenNotesWidget.routeName,
          path: OpenNotesWidget.routePath,
          builder: (context, params) => OpenNotesWidget(
            noteSelected: params.getParam(
              'noteSelected',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects', 'Notes'],
            ),
          ),
        ),
        FFRoute(
          name: EditSchoolWidget.routeName,
          path: EditSchoolWidget.routePath,
          builder: (context, params) => EditSchoolWidget(
            selectedSchool: params.getParam(
              'selectedSchool',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: SchoolCodeWidget.routeName,
          path: SchoolCodeWidget.routePath,
          builder: (context, params) => SchoolCodeWidget(
            schoolURL: params.getParam(
              'schoolURL',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: ItemsSubjectsWidget.routeName,
          path: ItemsSubjectsWidget.routePath,
          builder: (context, params) => ItemsSubjectsWidget(),
        ),
        FFRoute(
          name: PhoneAuthWidget.routeName,
          path: PhoneAuthWidget.routePath,
          builder: (context, params) => PhoneAuthWidget(),
        ),
        FFRoute(
          name: UsersListWidget.routeName,
          path: UsersListWidget.routePath,
          builder: (context, params) => UsersListWidget(
            isTeacher: params.getParam(
              'isTeacher',
              ParamType.bool,
            ),
            searchName: params.getParam(
              'searchName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SingleChatsWidget.routeName,
          path: SingleChatsWidget.routePath,
          builder: (context, params) => SingleChatsWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.String,
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            chatUser: params.getParam(
              'chatUser',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
            groupName: params.getParam(
              'groupName',
              ParamType.String,
            ),
            groupImage: params.getParam(
              'groupImage',
              ParamType.String,
            ),
            subjectInfo: params.getParam(
              'subjectInfo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Subjects'],
            ),
            userb: params.getParam(
              'userb',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: OpenWebWidget.routeName,
          path: OpenWebWidget.routePath,
          builder: (context, params) => OpenWebWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TeacherResultsWidget.routeName,
          path: TeacherResultsWidget.routePath,
          builder: (context, params) => TeacherResultsWidget(),
        ),
        FFRoute(
          name: ListOfApplicantsWidget.routeName,
          path: ListOfApplicantsWidget.routePath,
          builder: (context, params) => ListOfApplicantsWidget(),
        ),
        FFRoute(
          name: SingleAIChatWidget.routeName,
          path: SingleAIChatWidget.routePath,
          builder: (context, params) => SingleAIChatWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.String,
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            chatUser: params.getParam(
              'chatUser',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
            groupName: params.getParam(
              'groupName',
              ParamType.String,
            ),
            groupImage: params.getParam(
              'groupImage',
              ParamType.String,
            ),
            userb: params.getParam(
              'userb',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: AddEventsVideoWidget.routeName,
          path: AddEventsVideoWidget.routePath,
          builder: (context, params) => AddEventsVideoWidget(),
        ),
        FFRoute(
          name: VideoPlayerOffice45Widget.routeName,
          path: VideoPlayerOffice45Widget.routePath,
          builder: (context, params) => VideoPlayerOffice45Widget(),
        ),
        FFRoute(
          name: AuthenticateCopyWidget.routeName,
          path: AuthenticateCopyWidget.routePath,
          builder: (context, params) => AuthenticateCopyWidget(),
        ),
        FFRoute(
          name: NewprofileWidget.routeName,
          path: NewprofileWidget.routePath,
          builder: (context, params) => NewprofileWidget(),
        ),
        FFRoute(
          name: APScalculatorWidget.routeName,
          path: APScalculatorWidget.routePath,
          builder: (context, params) => APScalculatorWidget(),
        ),
        FFRoute(
          name: ResultsfinalWidget.routeName,
          path: ResultsfinalWidget.routePath,
          builder: (context, params) => ResultsfinalWidget(),
        ),
        FFRoute(
          name: NewprofileUserWidget.routeName,
          path: NewprofileUserWidget.routePath,
          builder: (context, params) => NewprofileUserWidget(
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: EditPostSingleWidget.routeName,
          path: EditPostSingleWidget.routePath,
          builder: (context, params) => EditPostSingleWidget(
            schoolEvent: params.getParam(
              'schoolEvent',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School', 'SchoolEvents'],
            ),
          ),
        ),
        FFRoute(
          name: VerificationAuthWidget.routeName,
          path: VerificationAuthWidget.routePath,
          builder: (context, params) => VerificationAuthWidget(),
        ),
        FFRoute(
          name: PostsByUserWidget.routeName,
          path: PostsByUserWidget.routePath,
          builder: (context, params) => PostsByUserWidget(
            userName: params.getParam(
              'userName',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: AnalysisWidget.routeName,
          path: AnalysisWidget.routePath,
          builder: (context, params) => AnalysisWidget(),
        ),
        FFRoute(
          name: AnalysisPageWidget.routeName,
          path: AnalysisPageWidget.routePath,
          asyncParams: {
            'totalactivities': getDocList(
                ['Subjects', 'Activity'], ActivityRecord.fromSnapshot),
            'totalnotes':
                getDocList(['Subjects', 'Notes'], NotesRecord.fromSnapshot),
          },
          builder: (context, params) => AnalysisPageWidget(
            totalactivities: params.getParam<ActivityRecord>(
              'totalactivities',
              ParamType.Document,
              isList: true,
            ),
            totalnotes: params.getParam<NotesRecord>(
              'totalnotes',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: DigitalDataAnalysisWidget.routeName,
          path: DigitalDataAnalysisWidget.routePath,
          builder: (context, params) => DigitalDataAnalysisWidget(
            teacher: params.getParam(
              'teacher',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: SchoolDashWidget.routeName,
          path: SchoolDashWidget.routePath,
          builder: (context, params) => SchoolDashWidget(
            school: params.getParam(
              'school',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['School'],
            ),
          ),
        ),
        FFRoute(
          name: SponsorWidget.routeName,
          path: SponsorWidget.routePath,
          builder: (context, params) => SponsorWidget(
            announcements: params.getParam(
              'announcements',
              ParamType.int,
            ),
            notes: params.getParam(
              'notes',
              ParamType.int,
            ),
            activities: params.getParam(
              'activities',
              ParamType.int,
            ),
            resources: params.getParam(
              'resources',
              ParamType.int,
            ),
            videos: params.getParam(
              'videos',
              ParamType.int,
            ),
            school: params.getParam(
              'school',
              ParamType.int,
            ),
            messages: params.getParam(
              'messages',
              ParamType.int,
            ),
            users: params.getParam(
              'users',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: BroadcastlistingWidget.routeName,
          path: BroadcastlistingWidget.routePath,
          builder: (context, params) => BroadcastlistingWidget(),
        ),
        FFRoute(
          name: StartmeetingWidget.routeName,
          path: StartmeetingWidget.routePath,
          builder: (context, params) => StartmeetingWidget(
            meetingName: params.getParam(
              'meetingName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ViewbroadcastWidget.routeName,
          path: ViewbroadcastWidget.routePath,
          builder: (context, params) => ViewbroadcastWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UsersWidget.routeName,
          path: UsersWidget.routePath,
          builder: (context, params) => UsersWidget(),
        ),
        FFRoute(
          name: EditProfileUsersWidget.routeName,
          path: EditProfileUsersWidget.routePath,
          builder: (context, params) => EditProfileUsersWidget(
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authenticateCopy';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/logo-office45_(1)_(1).png',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
