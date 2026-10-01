import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'digita_office_space_model.dart';
export 'digita_office_space_model.dart';

class DigitaOfficeSpaceWidget extends StatefulWidget {
  const DigitaOfficeSpaceWidget({super.key});

  static String routeName = 'DigitaOfficeSpace';
  static String routePath = '/digitaOfficeSpace';

  @override
  State<DigitaOfficeSpaceWidget> createState() =>
      _DigitaOfficeSpaceWidgetState();
}

class _DigitaOfficeSpaceWidgetState extends State<DigitaOfficeSpaceWidget>
    with TickerProviderStateMixin {
  late DigitaOfficeSpaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DigitaOfficeSpaceModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ChatsRecord>>(
      stream: queryChatsRecord(
        queryBuilder: (chatsRecord) => chatsRecord
            .where(
              'membersChatting',
              arrayContains: currentUserReference,
            )
            .where(
              'user_b',
              isEqualTo: FFAppState().aiUser,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: SpinKitPumpingHeart(
                  color: Color(0xC1295CFB),
                  size: 80.0,
                ),
              ),
            ),
          );
        }
        List<ChatsRecord> digitaOfficeSpaceChatsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed(BroadcastlistingWidget.routeName);
              },
              elevation: 8.0,
              child: Icon(
                Icons.terminal_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    NewprofileWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 500),
                      ),
                    },
                  );
                },
              ),
              title: Text(
                'Digital Office Space',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).customColor1,
                    size: 34.0,
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                NewprofileWidget.routeName);
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              currentUserPhoto,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 8.0, 25.0, 8.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.fullName,
                                                      ''),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .amOrPM(dateTimeFormat(
                                                    "jm",
                                                    getCurrentTimestamp,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )),
                                                  'Good Morning',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1F82E7),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          child: Icon(
                                            Icons.search_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 2000),
                                                () => safeSetState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Search...',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'My Subjects',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.teacher, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final subjects = (currentUserDocument
                                                    ?.subjectRegistered
                                                    ?.toList() ??
                                                [])
                                            .toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(subjects.length,
                                                    (subjectsIndex) {
                                              final subjectsItem =
                                                  subjects[subjectsIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 12.0, 12.0),
                                                child: StreamBuilder<
                                                    SubjectsRecord>(
                                                  stream: SubjectsRecord
                                                      .getDocument(
                                                          subjectsItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          child:
                                                              SpinKitPumpingHeart(
                                                            color: Color(
                                                                0xC1295CFB),
                                                            size: 80.0,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final projectCardSubjectsRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 230.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x34090F13),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Visibility(
                                                        visible:
                                                            projectCardSubjectsRecord !=
                                                                null,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                SubjectTasksWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'subject':
                                                                      serializeParam(
                                                                    projectCardSubjectsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 140.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF1F82E7),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              12.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF1F82E7),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              36.0,
                                                                          height:
                                                                              36.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x98FFFFFF),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.menu_open_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          projectCardSubjectsRecord
                                                                              .level,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          projectCardSubjectsRecord
                                                                              .subjectName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "yQQQ",
                                                                                  projectCardSubjectsRecord.createdAt!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: FutureBuilder<int>(
                                                                                future: queryActivityRecordCount(
                                                                                  parent: projectCardSubjectsRecord.reference,
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 80.0,
                                                                                        height: 80.0,
                                                                                        child: SpinKitPumpingHeart(
                                                                                          color: Color(0xC1295CFB),
                                                                                          size: 80.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  int textCount = snapshot.data!;

                                                                                  return Text(
                                                                                    valueOrDefault<String>(
                                                                                      textCount.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (projectCardSubjectsRecord
                                                                    .hasTeacher())
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child: StreamBuilder<
                                                                          UsersRecord>(
                                                                        stream:
                                                                            UsersRecord.getDocument(projectCardSubjectsRecord.teacher!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                child: SpinKitPumpingHeart(
                                                                                  color: Color(0xC1295CFB),
                                                                                  size: 80.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }

                                                                          final rowUsersRecord =
                                                                              snapshot.data!;

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 40.0,
                                                                                child: Stack(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-0.91, 0.0),
                                                                                      child: Container(
                                                                                        width: 32.0,
                                                                                        height: 32.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          rowUsersRecord.photoUrl,
                                                                                          fit: BoxFit.fitWidth,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Text(
                                                                                    rowUsersRecord.fullName,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          4.0),
                                                                  child:
                                                                      LinearPercentIndicator(
                                                                    percent:
                                                                        0.25,
                                                                    lineHeight:
                                                                        16.0,
                                                                    animation:
                                                                        true,
                                                                    animateFromLastPercent:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barRadius: Radius
                                                                        .circular(
                                                                            16.0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation1']!);
                                                  },
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.teacher, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final teacher = (currentUserDocument
                                                    ?.subjectsEducating
                                                    ?.toList() ??
                                                [])
                                            .toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                teacher.length, (teacherIndex) {
                                              final teacherItem =
                                                  teacher[teacherIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 12.0, 12.0),
                                                child: StreamBuilder<
                                                    SubjectsRecord>(
                                                  stream: SubjectsRecord
                                                      .getDocument(teacherItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          child:
                                                              SpinKitPumpingHeart(
                                                            color: Color(
                                                                0xC1295CFB),
                                                            size: 80.0,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final projectCardSubjectsRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 230.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x34090F13),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Visibility(
                                                        visible:
                                                            projectCardSubjectsRecord !=
                                                                null,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                DashboardTeacherWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'subjectSelected':
                                                                      serializeParam(
                                                                    teacherItem,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'schoolSubject':
                                                                      serializeParam(
                                                                    currentUserDocument
                                                                        ?.schoolRegistered,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 140.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF1F82E7),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              12.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF1F82E7),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              36.0,
                                                                          height:
                                                                              36.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x98FFFFFF),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.menu_open_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          projectCardSubjectsRecord
                                                                              .level,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          projectCardSubjectsRecord
                                                                              .subjectName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "yQQQ",
                                                                                  projectCardSubjectsRecord.createdAt!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: FutureBuilder<int>(
                                                                                future: queryActivityRecordCount(
                                                                                  parent: projectCardSubjectsRecord.reference,
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 80.0,
                                                                                        height: 80.0,
                                                                                        child: SpinKitPumpingHeart(
                                                                                          color: Color(0xC1295CFB),
                                                                                          size: 80.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  int textCount = snapshot.data!;

                                                                                  return Text(
                                                                                    valueOrDefault<String>(
                                                                                      textCount.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          4.0),
                                                                  child:
                                                                      LinearPercentIndicator(
                                                                    percent:
                                                                        0.25,
                                                                    lineHeight:
                                                                        16.0,
                                                                    animation:
                                                                        true,
                                                                    animateFromLastPercent:
                                                                        true,
                                                                    progressColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barRadius: Radius
                                                                        .circular(
                                                                            16.0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation7']!);
                                                  },
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 0.0, 8.0),
                                    child: Text(
                                      'My Activities',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x32000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.96,
                                      constraints: BoxConstraints(
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: FlutterFlowButtonTabBar(
                                                useToggleButtonStyle: false,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                unselectedLabelStyle:
                                                    TextStyle(),
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                backgroundColor:
                                                    Color(0x00FFFFFF),
                                                unselectedBackgroundColor:
                                                    Color(0x00FFFFFF),
                                                borderColor: Color(0xFF307AE5),
                                                unselectedBorderColor:
                                                    Color(0x00FFFFFF),
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                elevation: 0.0,
                                                buttonMargin:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 8.0, 0.0),
                                                padding: EdgeInsets.all(4.0),
                                                tabs: [
                                                  Tab(
                                                    text: 'Today',
                                                  ),
                                                  Tab(
                                                    text: 'Tomorrow',
                                                  ),
                                                  Tab(
                                                    text: 'Upcoming',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Visibility(
                                                      visible: !valueOrDefault<
                                                              bool>(
                                                          currentUserDocument
                                                              ?.teacher,
                                                          false),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.95,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FFFFFF),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final subjectsName =
                                                                        (currentUserDocument?.subjectRegistered?.toList() ??
                                                                                [])
                                                                            .toList();

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          subjectsName
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              subjectsNameIndex) {
                                                                        final subjectsNameItem =
                                                                            subjectsName[subjectsNameIndex];
                                                                        return StreamBuilder<
                                                                            List<ActivityRecord>>(
                                                                          stream:
                                                                              queryActivityRecord(
                                                                            parent:
                                                                                subjectsNameItem,
                                                                            queryBuilder: (activityRecord) =>
                                                                                activityRecord.where(
                                                                              'DueDate',
                                                                              isGreaterThan: functions.subtractDays(0)?.lastOrNull,
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 80.0,
                                                                                  height: 80.0,
                                                                                  child: SpinKitPumpingHeart(
                                                                                    color: Color(0xC1295CFB),
                                                                                    size: 80.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<ActivityRecord>
                                                                                columnActivityRecordList =
                                                                                snapshot.data!;

                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: List.generate(columnActivityRecordList.length, (columnIndex) {
                                                                                final columnActivityRecord = columnActivityRecordList[columnIndex];
                                                                                return StreamBuilder<SubjectsRecord>(
                                                                                  stream: SubjectsRecord.getDocument(subjectsNameItem),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 80.0,
                                                                                          height: 80.0,
                                                                                          child: SpinKitPumpingHeart(
                                                                                            color: Color(0xC1295CFB),
                                                                                            size: 80.0,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    final rowSubjectsRecord = snapshot.data!;

                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (rowSubjectsRecord != null)
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 5.0, 12.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                height: 150.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 0.0,
                                                                                                      color: Color(0xFFE0E3E7),
                                                                                                      offset: Offset(
                                                                                                        0.0,
                                                                                                        1.0,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: Color(0xFF1F82E7),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 2.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        ListOfActivitiesWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'subjectRef': serializeParam(
                                                                                                            rowSubjectsRecord.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                                                                                                          child: Container(
                                                                                                            width: 4.0,
                                                                                                            height: 80.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0xFF1F82E7),
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 4.0),
                                                                                                                      child: Text(
                                                                                                                        rowSubjectsRecord.subjectName,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                      child: Text(
                                                                                                                        columnActivityRecord.name,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  ),
                                                                                                                  child: Text(
                                                                                                                    columnActivityRecord.content,
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          'Due',
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Expanded(
                                                                                                                        child: Text(
                                                                                                                          dateTimeFormat(
                                                                                                                            "relative",
                                                                                                                            columnActivityRecord.dueDate!,
                                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                color: Color(0xFF1F82E7),
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                        child: badges.Badge(
                                                                                                                          badgeContent: Text(
                                                                                                                            '1',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  color: Colors.white,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          showBadge: true,
                                                                                                                          shape: badges.BadgeShape.circle,
                                                                                                                          badgeColor: FlutterFlowTheme.of(context).customColor1,
                                                                                                                          elevation: 4.0,
                                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                                          position: badges.BadgePosition.topStart(),
                                                                                                                          animationType: badges.BadgeAnimationType.scale,
                                                                                                                          toAnimate: true,
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                context.pushNamed(
                                                                                                                                  AttemptTaskWidget.routeName,
                                                                                                                                  queryParameters: {
                                                                                                                                    'activity': serializeParam(
                                                                                                                                      columnActivityRecord.reference,
                                                                                                                                      ParamType.DocumentReference,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Text(
                                                                                                                                'Update',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                      color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 100.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00F1F4F8),
                                                      ),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            final subjectsName =
                                                                (currentUserDocument
                                                                            ?.subjectRegistered
                                                                            ?.toList() ??
                                                                        [])
                                                                    .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  subjectsName
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  subjectsNameIndex) {
                                                                final subjectsNameItem =
                                                                    subjectsName[
                                                                        subjectsNameIndex];
                                                                return StreamBuilder<
                                                                    List<
                                                                        ActivityRecord>>(
                                                                  stream:
                                                                      queryActivityRecord(
                                                                    parent:
                                                                        subjectsNameItem,
                                                                    queryBuilder: (activityRecord) =>
                                                                        activityRecord
                                                                            .where(
                                                                              'DueDate',
                                                                              isLessThan: functions.subtractDays(0)?.lastOrNull,
                                                                            )
                                                                            .where(
                                                                              'DueDate',
                                                                              isGreaterThanOrEqualTo: functions.subtractDays(1)?.lastOrNull,
                                                                            ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          child:
                                                                              SpinKitPumpingHeart(
                                                                            color:
                                                                                Color(0xC1295CFB),
                                                                            size:
                                                                                80.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ActivityRecord>
                                                                        columnActivityRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: List.generate(
                                                                          columnActivityRecordList
                                                                              .length,
                                                                          (columnIndex) {
                                                                        final columnActivityRecord =
                                                                            columnActivityRecordList[columnIndex];
                                                                        return StreamBuilder<
                                                                            SubjectsRecord>(
                                                                          stream:
                                                                              SubjectsRecord.getDocument(subjectsNameItem),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 80.0,
                                                                                  height: 80.0,
                                                                                  child: SpinKitPumpingHeart(
                                                                                    color: Color(0xC1295CFB),
                                                                                    size: 80.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final rowSubjectsRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 5.0, 12.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: 150.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 0.0,
                                                                                            color: Color(0xFFE0E3E7),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              1.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFF1F82E7),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 2.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              ListOfActivitiesWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'subjectRef': serializeParam(
                                                                                                  rowSubjectsRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                                                                                                child: Container(
                                                                                                  width: 4.0,
                                                                                                  height: 80.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFF1F82E7),
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 4.0),
                                                                                                            child: Text(
                                                                                                              rowSubjectsRecord.subjectName,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                            child: Text(
                                                                                                              columnActivityRecord.name,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Text(
                                                                                                          columnActivityRecord.content,
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'Due',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Text(
                                                                                                                dateTimeFormat(
                                                                                                                  "relative",
                                                                                                                  columnActivityRecord.dueDate!,
                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      color: Color(0xFF1F82E7),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                              child: badges.Badge(
                                                                                                                badgeContent: Text(
                                                                                                                  '1',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: Colors.white,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                showBadge: true,
                                                                                                                shape: badges.BadgeShape.circle,
                                                                                                                badgeColor: FlutterFlowTheme.of(context).customColor1,
                                                                                                                elevation: 4.0,
                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                position: badges.BadgePosition.topStart(),
                                                                                                                animationType: badges.BadgeAnimationType.scale,
                                                                                                                toAnimate: true,
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      context.pushNamed(
                                                                                                                        AttemptTaskWidget.routeName,
                                                                                                                        queryParameters: {
                                                                                                                          'activity': serializeParam(
                                                                                                                            columnActivityRecord.reference,
                                                                                                                            ParamType.DocumentReference,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Text(
                                                                                                                      'Update',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 100.0,
                                                      height: 1000.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00F1F4F8),
                                                      ),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            final subjectsName =
                                                                (currentUserDocument
                                                                            ?.subjectRegistered
                                                                            ?.toList() ??
                                                                        [])
                                                                    .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  subjectsName
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  subjectsNameIndex) {
                                                                final subjectsNameItem =
                                                                    subjectsName[
                                                                        subjectsNameIndex];
                                                                return StreamBuilder<
                                                                    List<
                                                                        ActivityRecord>>(
                                                                  stream:
                                                                      queryActivityRecord(
                                                                    parent:
                                                                        subjectsNameItem,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          child:
                                                                              SpinKitPumpingHeart(
                                                                            color:
                                                                                Color(0xC1295CFB),
                                                                            size:
                                                                                80.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ActivityRecord>
                                                                        columnActivityRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: List.generate(
                                                                          columnActivityRecordList
                                                                              .length,
                                                                          (columnIndex) {
                                                                        final columnActivityRecord =
                                                                            columnActivityRecordList[columnIndex];
                                                                        return StreamBuilder<
                                                                            SubjectsRecord>(
                                                                          stream:
                                                                              SubjectsRecord.getDocument(subjectsNameItem),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 80.0,
                                                                                  height: 80.0,
                                                                                  child: SpinKitPumpingHeart(
                                                                                    color: Color(0xC1295CFB),
                                                                                    size: 80.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final rowSubjectsRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (rowSubjectsRecord != null)
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 5.0, 12.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 150.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 0.0,
                                                                                              color: Color(0xFFE0E3E7),
                                                                                              offset: Offset(
                                                                                                0.0,
                                                                                                1.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFF1F82E7),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 2.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                ListOfActivitiesWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'subjectRef': serializeParam(
                                                                                                    rowSubjectsRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                                                                                                  child: Container(
                                                                                                    width: 4.0,
                                                                                                    height: 80.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFF1F82E7),
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 4.0),
                                                                                                              child: Text(
                                                                                                                rowSubjectsRecord.subjectName.maybeHandleOverflow(
                                                                                                                  maxChars: 12,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                              child: Text(
                                                                                                                columnActivityRecord.name.maybeHandleOverflow(
                                                                                                                  maxChars: 15,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Text(
                                                                                                            columnActivityRecord.content,
                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Due',
                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  dateTimeFormat(
                                                                                                                    "M/d H:mm",
                                                                                                                    columnActivityRecord.dueDate!,
                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: Color(0xFF1F82E7),
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                child: badges.Badge(
                                                                                                                  badgeContent: Text(
                                                                                                                    '1',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          color: Colors.white,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  showBadge: true,
                                                                                                                  shape: badges.BadgeShape.circle,
                                                                                                                  badgeColor: FlutterFlowTheme.of(context).customColor1,
                                                                                                                  elevation: 4.0,
                                                                                                                  padding: EdgeInsets.all(8.0),
                                                                                                                  position: badges.BadgePosition.topStart(),
                                                                                                                  animationType: badges.BadgeAnimationType.scale,
                                                                                                                  toAnimate: true,
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                                                                                                                    child: InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        context.pushNamed(
                                                                                                                          AttemptTaskWidget.routeName,
                                                                                                                          queryParameters: {
                                                                                                                            'activity': serializeParam(
                                                                                                                              columnActivityRecord.reference,
                                                                                                                              ParamType.DocumentReference,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
                                                                                                                        );
                                                                                                                      },
                                                                                                                      child: Text(
                                                                                                                        'Update',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
