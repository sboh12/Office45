import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buttons_options_widget.dart';
import '/components/comment_box_widget.dart';
import '/components/edit_post_widget.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'announcements_model.dart';
export 'announcements_model.dart';

class AnnouncementsWidget extends StatefulWidget {
  const AnnouncementsWidget({super.key});

  static String routeName = 'Announcements';
  static String routePath = '/announcements';

  @override
  State<AnnouncementsWidget> createState() => _AnnouncementsWidgetState();
}

class _AnnouncementsWidgetState extends State<AnnouncementsWidget>
    with TickerProviderStateMixin {
  late AnnouncementsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnouncementsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'circleImageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: Colors.transparent,
          elevation: 99.0,
          label: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: StreamBuilder<List<ChatsRecord>>(
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
                      List<ChatsRecord> circleImageChatsRecordList =
                          snapshot.data!;

                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().members = [];
                          FFAppState().addToMembers(FFAppState().aiUser!);
                          FFAppState().addToMembers(currentUserReference!);
                          if (circleImageChatsRecordList.length > 0) {
                            context.pushNamed(
                              SingleAIChatWidget.routeName,
                              queryParameters: {
                                'userProfile': serializeParam(
                                  currentUserPhoto,
                                  ParamType.String,
                                ),
                                'userRef': serializeParam(
                                  currentUserReference,
                                  ParamType.DocumentReference,
                                ),
                                'chatUser': serializeParam(
                                  circleImageChatsRecordList
                                      .firstOrNull?.reference,
                                  ParamType.DocumentReference,
                                ),
                                'groupName': serializeParam(
                                  'Office45 AI',
                                  ParamType.String,
                                ),
                                'groupImage': serializeParam(
                                  currentUserPhoto,
                                  ParamType.String,
                                ),
                                'userb': serializeParam(
                                  FFAppState().aiUser,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Initialising',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).success,
                              ),
                            );
                            FFAppState().members = [];
                            FFAppState().addToMembers(currentUserReference!);
                            FFAppState().addToMembers(FFAppState().aiUser!);
                            FFAppState().addToMembers(currentUserReference!);

                            await ChatsRecord.collection.doc().set({
                              ...createChatsRecordData(
                                user: currentUserReference,
                                userA: currentUserReference,
                                lastMessage: 'Hello',
                                image: currentUserPhoto,
                                userB: FFAppState().aiUser,
                                lastMessageTime: getCurrentTimestamp,
                                messageSeen: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'membersChatting': FFAppState().members,
                                },
                              ),
                            });
                          }
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/logo-office45.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['circleImageOnPageLoadAnimation']!);
                    },
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(VideoPlayerOffice45Widget.routeName);
                  },
                  child: Icon(
                    Icons.video_collection_sharp,
                    color: Color(0xF61F82E7),
                    size: 48.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 3.0,
          child: WebViewAware(
            child: wrapWithModel(
              model: _model.menuModel,
              updateCallback: () => safeSetState(() {}),
              child: MenuWidget(),
            ),
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
              Icons.menu,
              color: Color(0xFF1F82E7),
              size: 30.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: AutoSizeText(
            'Announcements',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                ),
          ),
          actions: [
            AuthUserStreamWidget(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(NewprofileWidget.routeName);
                },
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: valueOrDefault<String>(
                      functions.twickPicImagePath(
                          currentUserPhoto, '&twic=v1/resize=100/cover=1:1'),
                      'https://yt3.googleusercontent.com/qtLoSGi6EpmAHj4AbbPMVVt9PHE2Em5ZAdM2ZbKrmnZS1pjnjt4bCDIj-QRUM00mdHshsExZZg=s900-c-k-c0x00ffffff-no-rj',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: valueOrDefault<bool>(
                      currentUserDocument?.principal, false) ||
                  valueOrDefault<bool>(currentUserDocument?.teacher, false) ||
                  valueOrDefault<bool>(currentUserDocument?.admin, false) ||
                  (currentUserDocument?.schoolRegistered != null),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: FlutterFlowTheme.of(context).tertiary,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ButtonsOptionsWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.add_rounded,
                      color: Color(0xFF1F82E7),
                      size: 34.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF1F82E7),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () => safeSetState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault<bool>(
                              currentUserDocument?.principal, false) ||
                          valueOrDefault<bool>(
                              currentUserDocument?.teacher, false) ||
                          valueOrDefault<bool>(
                              currentUserDocument?.admin, false) ||
                          (currentUserDocument?.schoolRegistered != null))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 12.0, 12.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ButtonsOptionsWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x34090F13),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 160.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFF1F82E7),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                              child: Image.network(
                                                currentUserPhoto,
                                                width: 300.0,
                                                height: 140.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.principal,
                                                    false) ||
                                                valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.teacher,
                                                    false) ||
                                                valueOrDefault<bool>(
                                                    currentUserDocument?.admin,
                                                    false) ||
                                                (currentUserDocument
                                                        ?.schoolRegistered !=
                                                    null))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: Color(0xF61F82E7),
                                                  size: 40.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Text(
                                            'Add post',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 5.0),
                        child: StreamBuilder<List<SchoolRecord>>(
                          stream: querySchoolRecord(),
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
                            List<SchoolRecord> rowSchoolRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    rowSchoolRecordList.length, (rowIndex) {
                                  final rowSchoolRecord =
                                      rowSchoolRecordList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          ProfileSchoolWidget.routeName,
                                          queryParameters: {
                                            'school': serializeParam(
                                              rowSchoolRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      onDoubleTap: () async {
                                        context.pushNamed(
                                          SchoolCodeWidget.routeName,
                                          queryParameters: {
                                            'schoolURL': serializeParam(
                                              rowSchoolRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .topToBottom,
                                              duration:
                                                  Duration(milliseconds: 500),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x34090F13),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 160.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(12.0),
                                                  ),
                                                  border: Border.all(
                                                    color: Color(0xFF1F82E7),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl: functions
                                                            .twickPicImagePath(
                                                                rowSchoolRecord
                                                                    .image,
                                                                '&twic=v1/resize=300/cover=1:1')!,
                                                        width: 300.0,
                                                        height: 140.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.8, -0.98),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    8.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: badges.Badge(
                                                          badgeContent: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              rowSchoolRecord
                                                                  .enrollment
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                          ),
                                                          showBadge: true,
                                                          shape: badges
                                                              .BadgeShape
                                                              .circle,
                                                          badgeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor1,
                                                          elevation: 4.0,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          position: badges
                                                                  .BadgePosition
                                                              .topEnd(),
                                                          animationType: badges
                                                              .BadgeAnimationType
                                                              .scale,
                                                          toAnimate: true,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        18.0,
                                                                        0.0),
                                                            child: Text(
                                                              'New',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    rowSchoolRecord.name
                                                        .maybeHandleOverflow(
                                                      maxChars: 13,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_model.textController.text == null ||
                          _model.textController.text == '')
                        PagedListView<DocumentSnapshot<Object?>?,
                            SchoolEventsRecord>(
                          pagingController: _model.setListViewController(
                            SchoolEventsRecord.collection()
                                .orderBy('Created_at', descending: true),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<SchoolEventsRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: SpinKitPumpingHeart(
                                  color: Color(0xC1295CFB),
                                  size: 80.0,
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: SpinKitPumpingHeart(
                                  color: Color(0xC1295CFB),
                                  size: 80.0,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewSchoolEventsRecord = _model
                                  .listViewPagingController!
                                  .itemList![listViewIndex];
                              return Visibility(
                                visible: listViewSchoolEventsRecord
                                            .eventUpload ==
                                        null ||
                                    listViewSchoolEventsRecord.eventUpload ==
                                        '',
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 12.0, 2.0, 12.0),
                                    child: StreamBuilder<SchoolRecord>(
                                      stream: SchoolRecord.getDocument(
                                          listViewSchoolEventsRecord
                                              .parentReference),
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

                                        final containerSchoolRecord =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2.0,
                                                color: Color(0x520E151B),
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12.0),
                                              bottomRight:
                                                  Radius.circular(12.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                            border: Border.all(
                                              color: Color(0xFF1F82E7),
                                              width: 3.0,
                                            ),
                                          ),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    CommentBoxWidget(
                                                                  eventS: listViewSchoolEventsRecord
                                                                      .reference,
                                                                  school: listViewSchoolEventsRecord
                                                                      .parentReference,
                                                                  poster: listViewSchoolEventsRecord
                                                                      .eventPoster
                                                                      .firstOrNull,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    child: Image.network(
                                                      functions.twickPicImagePath(
                                                          listViewSchoolEventsRecord
                                                              .eventPoster
                                                              .firstOrNull,
                                                          '&twic=v1/resize=500/cover=1:1')!,
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.6,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      12.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      12.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      12.0),
                                                            ),
                                                            child:
                                                                BackdropFilter(
                                                              filter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 2.0,
                                                                sigmaY: 2.0,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      100.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              12.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x81FFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(12.0),
                                                                        bottomRight:
                                                                            Radius.circular(12.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (listViewSchoolEventsRecord.likedUser.contains(currentUserReference))
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await listViewSchoolEventsRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'LikedUser': FieldValue.arrayRemove([
                                                                                                currentUserReference
                                                                                              ]),
                                                                                              'Likes': FieldValue.increment(-(1)),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.favorite,
                                                                                        color: Color(0xFF1F82E7),
                                                                                        size: 36.0,
                                                                                      ),
                                                                                    ),
                                                                                  if (!listViewSchoolEventsRecord.likedUser.contains(currentUserReference))
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await listViewSchoolEventsRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'LikedUser': FieldValue.arrayUnion([
                                                                                                currentUserReference
                                                                                              ]),
                                                                                              'Likes': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.favorite_border,
                                                                                        color: Color(0xFF1F82E7),
                                                                                        size: 36.0,
                                                                                      ),
                                                                                    ),
                                                                                  badges.Badge(
                                                                                    badgeContent: Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewSchoolEventsRecord.likes.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: Colors.white,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    showBadge: true,
                                                                                    shape: badges.BadgeShape.circle,
                                                                                    badgeColor: Color(0xFF1F82E7),
                                                                                    elevation: 4.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    position: badges.BadgePosition.topEnd(),
                                                                                    animationType: badges.BadgeAnimationType.scale,
                                                                                    toAnimate: true,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              if (valueOrDefault<bool>(
                                                                                currentUserDocument?.schoolRegistered != null,
                                                                                false,
                                                                              ))
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Color(0x50000000),
                                                                                        barrierColor: Color(0x42000000),
                                                                                        enableDrag: false,
                                                                                        useSafeArea: true,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(context).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: CommentBoxWidget(
                                                                                                  eventS: listViewSchoolEventsRecord.reference,
                                                                                                  school: listViewSchoolEventsRecord.parentReference,
                                                                                                  poster: listViewSchoolEventsRecord.eventPoster.firstOrNull,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 50.0,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.solidComment,
                                                                                              color: Color(0xFF1F82E7),
                                                                                              size: 30.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                child: StreamBuilder<UsersRecord>(
                                                                                  stream: UsersRecord.getDocument(listViewSchoolEventsRecord.eventOrganizer!),
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

                                                                                    final rowUsersRecord = snapshot.data!;

                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          PostsByUserWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'userName': serializeParam(
                                                                                              rowUsersRecord.reference,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 30.0,
                                                                                            height: 30.0,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              functions.twickPicImagePath(rowUsersRecord.photoUrl, '&twic=v1/resize=100/cover=1:1')!,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            () {
                                                                                              if (rowUsersRecord.displayName != null && rowUsersRecord.displayName != '') {
                                                                                                return rowUsersRecord.displayName;
                                                                                              } else if (rowUsersRecord.fullName != null && rowUsersRecord.fullName != '') {
                                                                                                return rowUsersRecord.fullName;
                                                                                              } else {
                                                                                                return rowUsersRecord.phoneNumber;
                                                                                              }
                                                                                            }()
                                                                                                .maybeHandleOverflow(
                                                                                              maxChars: 13,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)).addToStart(SizedBox(width: 5.0)).addToEnd(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (!containerSchoolRecord.followers.contains(currentUserReference))
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await containerSchoolRecord.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'Followers': FieldValue.arrayUnion([currentUserReference]),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            },
                                                                                            text: 'Follow',
                                                                                            options: FFButtonOptions(
                                                                                              width: 80.0,
                                                                                              height: 35.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: Color(0xFF1F82E7),
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.lexendDeca(
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                              elevation: 2.0,
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (containerSchoolRecord.followers.contains(currentUserReference))
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await containerSchoolRecord.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'Followers': FieldValue.arrayRemove([currentUserReference]),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            },
                                                                                            text: 'following',
                                                                                            options: FFButtonOptions(
                                                                                              width: 80.0,
                                                                                              height: 35.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: Color(0xFF1F82E7),
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.lexendDeca(
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                              elevation: 2.0,
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)).addToStart(SizedBox(width: 5.0)).addToEnd(SizedBox(width: 5.0)),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                listViewSchoolEventsRecord.content.maybeHandleOverflow(
                                                                                  maxChars: 60,
                                                                                ),
                                                                                maxLines: 2,
                                                                                minFontSize: 5.0,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                    ),
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -2.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x41FFFFFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl: functions.twickPicImagePath(
                                                                              containerSchoolRecord.image,
                                                                              ' &twic=v1/resize=100/cover=1:1')!,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          containerSchoolRecord
                                                                              .name
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                25,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if ((listViewSchoolEventsRecord.eventOrganizer ==
                                                                            currentUserReference) ||
                                                                        (valueOrDefault<bool>(currentUserDocument?.principal, false) &&
                                                                            (currentUserDocument?.schoolRegistered ==
                                                                                listViewSchoolEventsRecord
                                                                                    .parentReference)) ||
                                                                        valueOrDefault<bool>(
                                                                            currentUserDocument?.admin,
                                                                            false))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: EditPostWidget(
                                                                                          eventPost: listViewSchoolEventsRecord.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.keyboard_control_outlined,
                                                                              color: Color(0xFF1F82E7),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation']!);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
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
    );
  }
}
