import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'open_notes_model.dart';
export 'open_notes_model.dart';

class OpenNotesWidget extends StatefulWidget {
  const OpenNotesWidget({
    super.key,
    required this.noteSelected,
  });

  final DocumentReference? noteSelected;

  static String routeName = 'openNotes';
  static String routePath = '/openNotes';

  @override
  State<OpenNotesWidget> createState() => _OpenNotesWidgetState();
}

class _OpenNotesWidgetState extends State<OpenNotesWidget>
    with TickerProviderStateMixin {
  late OpenNotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenNotesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.notesDocuments =
          await NotesRecord.getDocumentOnce(widget!.noteSelected!);
      _model.outputRating = await queryNotesRatingRecordOnce(
        parent: _model.notesDocuments?.parentReference,
        queryBuilder: (notesRatingRecord) => notesRatingRecord
            .where(
              'notesRef',
              isEqualTo: _model.notesDocuments?.reference,
            )
            .where(
              'studentRef',
              isEqualTo: currentUserReference,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.chatUser = await queryChatsRecordOnce(
        queryBuilder: (chatsRecord) => chatsRecord
            .where(
              'user_b',
              isEqualTo: FFAppState().aiUser,
            )
            .where(
              'membersChatting',
              arrayContains: currentUserReference,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    _model.textController ??=
        TextEditingController(text: FFAppState().copiedPDF);
    _model.textFieldFocusNode ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
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
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
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
      'iconOnPageLoadAnimation3': AnimationInfo(
        loop: true,
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
      'containerOnPageLoadAnimation': AnimationInfo(
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<NotesRecord>(
      stream: NotesRecord.getDocument(widget!.noteSelected!),
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

        final openNotesNotesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Set Ratings',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleLargeIsCustom,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 36.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                        currentUserDocument?.teacher, false))
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 430.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
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
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Notes Analysis',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeIsCustom,
                                                ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 44.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(-1.0, 0),
                                          child: FlutterFlowButtonTabBar(
                                            useToggleButtonStyle: false,
                                            isScrollable: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            unselectedLabelStyle: TextStyle(),
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            unselectedBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            unselectedBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 12.0,
                                            elevation: 0.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            buttonMargin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 0.0, 8.0),
                                            tabs: [
                                              Tab(
                                                text: 'New Read',
                                              ),
                                              Tab(
                                                text: 'All',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [() async {}, () async {}][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
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
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                NotesRatingRecord>>(
                                                          stream:
                                                              queryNotesRatingRecord(
                                                            parent: openNotesNotesRecord
                                                                .parentReference,
                                                            queryBuilder: (notesRatingRecord) =>
                                                                notesRatingRecord
                                                                    .where(
                                                                      'notesRef',
                                                                      isEqualTo:
                                                                          widget!
                                                                              .noteSelected,
                                                                    )
                                                                    .orderBy(
                                                                        'created_at',
                                                                        descending:
                                                                            true),
                                                            limit: 5,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<NotesRatingRecord>
                                                                listViewNotesRatingRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewNotesRatingRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewNotesRatingRecord =
                                                                    listViewNotesRatingRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                  child: StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        listViewNotesRatingRecord
                                                                            .studentRef!),
                                                                    builder:
                                                                        (context,
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
                                                                              color: Color(0xC1295CFB),
                                                                              size: 80.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final containerUsersRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 0.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
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
                                                                              context.pushNamed(
                                                                                NewprofileUserWidget.routeName,
                                                                                queryParameters: {
                                                                                  'user': serializeParam(
                                                                                    containerUsersRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 4.0,
                                                                                  height: 44.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    containerUsersRecord.photoUrl,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          containerUsersRecord.fullName.maybeHandleOverflow(
                                                                                            maxChars: 20,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${valueOrDefault<String>(
                                                                                                formatNumber(
                                                                                                  listViewNotesRatingRecord.readTime / 60000,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.automatic,
                                                                                                ),
                                                                                                '0',
                                                                                              )}Minutes',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w100,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "relative",
                                                                                      listViewNotesRatingRecord.createdAt,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
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
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                NotesRatingRecord>>(
                                                          stream:
                                                              queryNotesRatingRecord(
                                                            parent: openNotesNotesRecord
                                                                .parentReference,
                                                            queryBuilder: (notesRatingRecord) =>
                                                                notesRatingRecord
                                                                    .where(
                                                                      'notesRef',
                                                                      isEqualTo:
                                                                          widget!
                                                                              .noteSelected,
                                                                    )
                                                                    .orderBy(
                                                                        'readTime',
                                                                        descending:
                                                                            true),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<NotesRatingRecord>
                                                                listViewNotesRatingRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewNotesRatingRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewNotesRatingRecord =
                                                                    listViewNotesRatingRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                  child: StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        listViewNotesRatingRecord
                                                                            .studentRef!),
                                                                    builder:
                                                                        (context,
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
                                                                              color: Color(0xC1295CFB),
                                                                              size: 80.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final containerUsersRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 0.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
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
                                                                              context.pushNamed(
                                                                                NewprofileUserWidget.routeName,
                                                                                queryParameters: {
                                                                                  'user': serializeParam(
                                                                                    containerUsersRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 4.0,
                                                                                  height: 44.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    containerUsersRecord.photoUrl,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          containerUsersRecord.fullName.maybeHandleOverflow(
                                                                                            maxChars: 20,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${valueOrDefault<String>(
                                                                                                (listViewNotesRatingRecord.readTime / 60000).toString(),
                                                                                                '0',
                                                                                              )}Minutes'
                                                                                                  .maybeHandleOverflow(
                                                                                                maxChars: 8,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "relative",
                                                                                      listViewNotesRatingRecord.createdAt,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
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
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                        ),
                      ),
                    if (_model.outputRating?.reference != null)
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: StreamBuilder<List<NotesRatingRecord>>(
                              stream: queryNotesRatingRecord(
                                parent: openNotesNotesRecord.parentReference,
                                queryBuilder: (notesRatingRecord) =>
                                    notesRatingRecord.where(
                                  'notesRef',
                                  isEqualTo: widget!.noteSelected,
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
                                List<NotesRatingRecord>
                                    containerNotesRatingRecordList =
                                    snapshot.data!;

                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!valueOrDefault<bool>(
                                          currentUserDocument?.teacher, false))
                                        AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                child: RatingBar.builder(
                                                  onRatingUpdate:
                                                      (newValue) async {
                                                    safeSetState(() =>
                                                        _model.ratingBarValue1 =
                                                            newValue);
                                                    final firestoreBatch =
                                                        FirebaseFirestore
                                                            .instance
                                                            .batch();
                                                    try {
                                                      if (_model.outputRating
                                                              ?.reference !=
                                                          null) {
                                                        firestoreBatch.update(
                                                            _model.outputRating!
                                                                .reference,
                                                            {
                                                              ...createNotesRatingRecordData(
                                                                ratingStars: _model
                                                                    .ratingBarValue1
                                                                    ?.round(),
                                                                createdAt:
                                                                    getCurrentTimestamp,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'readTime':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                },
                                                              ),
                                                            });
                                                      } else {
                                                        firestoreBatch.set(
                                                            NotesRatingRecord.createDoc(
                                                                openNotesNotesRecord
                                                                    .parentReference),
                                                            createNotesRatingRecordData(
                                                              notesRef: widget!
                                                                  .noteSelected,
                                                              studentRef:
                                                                  currentUserReference,
                                                              ratingStars: _model
                                                                  .ratingBarValue1
                                                                  ?.round(),
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              readTime: _model
                                                                  .timerMilliseconds,
                                                            ));
                                                      }

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Rating Changed',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } finally {
                                                      await firestoreBatch
                                                          .commit();
                                                    }
                                                  },
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFFBC3F08),
                                                  ),
                                                  direction: Axis.horizontal,
                                                  initialRating: _model
                                                          .ratingBarValue1 ??=
                                                      valueOrDefault<double>(
                                                    containerNotesRatingRecordList
                                                                .length >
                                                            0
                                                        ? valueOrDefault<
                                                            double>(
                                                            functions
                                                                .averageList(containerNotesRatingRecordList
                                                                    .map((e) =>
                                                                        e.ratingStars)
                                                                    .toList())
                                                                ?.toDouble(),
                                                            0.0,
                                                          )
                                                        : 3.0,
                                                    3.0,
                                                  ),
                                                  unratedColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                  itemCount: 5,
                                                  itemSize: 40.0,
                                                  glowColor: Color(0xFFBC3F08),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if ((containerNotesRatingRecordList
                                                  .length >
                                              0) &&
                                          valueOrDefault<bool>(
                                              currentUserDocument?.teacher,
                                              false))
                                        AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFBC3F08),
                                                ),
                                                direction: Axis.horizontal,
                                                rating: valueOrDefault<double>(
                                                  containerNotesRatingRecordList
                                                              .length >
                                                          0
                                                      ? valueOrDefault<double>(
                                                          functions
                                                              .averageList(
                                                                  containerNotesRatingRecordList
                                                                      .map((e) =>
                                                                          e.ratingStars)
                                                                      .toList())
                                                              ?.toDouble(),
                                                          0.0,
                                                        )
                                                      : 3.0,
                                                  3.0,
                                                ),
                                                unratedColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                itemCount: 5,
                                                itemSize: 40.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            body: NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  backgroundColor: FlutterFlowTheme.of(context).success,
                  automaticallyImplyLeading: false,
                  title: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final firestoreBatch = FirebaseFirestore.instance.batch();
                      try {
                        if (_model.outputRating?.reference != null) {
                          firestoreBatch
                              .update(_model.outputRating!.reference, {
                            ...createNotesRatingRecordData(
                              createdAt: getCurrentTimestamp,
                            ),
                            ...mapToFirestore(
                              {
                                'readTime': FieldValue.increment(
                                    _model.timerMilliseconds),
                              },
                            ),
                          });
                        } else {
                          firestoreBatch.set(
                              NotesRatingRecord.createDoc(
                                  openNotesNotesRecord.parentReference),
                              createNotesRatingRecordData(
                                notesRef: widget!.noteSelected,
                                studentRef: currentUserReference,
                                readTime: _model.timerMilliseconds,
                                createdAt: getCurrentTimestamp,
                              ));
                        }

                        context.safePop();
                      } finally {
                        await firestoreBatch.commit();
                      }
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 36.0,
                    ),
                  ),
                  actions: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Icon(
                            Icons.menu_open_outlined,
                            color: FlutterFlowTheme.of(context).tertiary400,
                            size: 36.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 2.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'AI Search',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
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
                          if (openNotesNotesRecord.hasSummary())
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: ExpandableNotifier(
                                  controller:
                                      _model.expandableExpandableController,
                                  child: ExpandablePanel(
                                    header: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowTimer(
                                          initialTime:
                                              _model.timerInitialTimeMs,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate)
                                              safeSetState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmallIsCustom,
                                              ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.timerMilliseconds <=
                                                60000)
                                              Icon(
                                                Icons.monitor_heart,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                                size: 36.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation1']!),
                                            if ((_model.timerMilliseconds >
                                                    60000) &&
                                                (_model.timerMilliseconds <=
                                                    1800000))
                                              Icon(
                                                Icons.favorite,
                                                color: Color(0xFFFB5D00),
                                                size: 36.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation2']!),
                                            if (_model.timerMilliseconds >
                                                1800000)
                                              Icon(
                                                Icons.favorite,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                                size: 36.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation3']!),
                                          ],
                                        ),
                                      ],
                                    ),
                                    collapsed: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              openNotesNotesRecord.summary,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: Color(0x8A000000),
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          openNotesNotesRecord.summary,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Color(0x8A000000),
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: false,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (openNotesNotesRecord.hasNotesFile())
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final notesFile =
                                      openNotesNotesRecord.notesFile.toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(notesFile.length,
                                        (notesFileIndex) {
                                      final notesFileItem =
                                          notesFile[notesFileIndex];
                                      return Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        child: custom_widgets
                                            .OpenTextSelectablePDF(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          pdfLink: notesFileItem,
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          if (openNotesNotesRecord.hasNoteImages())
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final notesImage =
                                      openNotesNotesRecord.noteImages.toList();

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(notesImage.length,
                                          (notesImageIndex) {
                                        final notesImageItem =
                                            notesImage[notesImageIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: notesImageItem,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: notesImageItem,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: notesImageItem,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: notesImageItem,
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.cover,
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
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                alignment: AlignmentDirectional(0.0, 1.0),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
