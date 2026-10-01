import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'school_model.dart';
export 'school_model.dart';

class SchoolWidget extends StatefulWidget {
  const SchoolWidget({
    super.key,
    required this.schoolSelected,
  });

  final DocumentReference? schoolSelected;

  static String routeName = 'School';
  static String routePath = '/school';

  @override
  State<SchoolWidget> createState() => _SchoolWidgetState();
}

class _SchoolWidgetState extends State<SchoolWidget>
    with TickerProviderStateMixin {
  late SchoolModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchoolModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.applications = await queryApplicationsRecordOnce(
        parent: widget!.schoolSelected,
      );
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
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
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SchoolRecord>(
      stream: SchoolRecord.getDocument(widget!.schoolSelected!),
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

        final schoolSchoolRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  context.pop();
                },
              ),
              title: Text(
                schoolSchoolRecord.name,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
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
                            widget!.schoolSelected,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: functions.twickPicImagePath(
                            schoolSchoolRecord.image,
                            ' &twic=v1/resize=100/cover=1:1')!,
                        fit: BoxFit.cover,
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: FutureBuilder<int>(
                                                future:
                                                    querySchoolEventsRecordCount(
                                                  parent:
                                                      widget!.schoolSelected,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        child:
                                                            SpinKitPumpingHeart(
                                                          color:
                                                              Color(0xC1295CFB),
                                                          size: 80.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  int textCount =
                                                      snapshot.data!;

                                                  return Text(
                                                    valueOrDefault<String>(
                                                      textCount.toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Text(
                                              'Events',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  schoolSchoolRecord
                                                      .followers.length
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              'Followers ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  schoolSchoolRecord
                                                      .performance.length
                                                      .toString(),
                                                  '50',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              'Pass Rate',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (!schoolSchoolRecord.followers
                                              .contains(currentUserReference))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await widget!.schoolSelected!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'Followers': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text: 'Follow',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF1F82E7),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          if (schoolSchoolRecord.followers
                                              .contains(currentUserReference))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await widget!.schoolSelected!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'Followers': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text: 'unfollow',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF1F82E7),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (!schoolSchoolRecord.schoolApplications
                                              .contains(currentUserReference) ||
                                          (currentUserDocument
                                                  ?.schoolRegistered ==
                                              widget!.schoolSelected))
                                        AuthUserStreamWidget(
                                          builder: (context) => StreamBuilder<
                                              List<ApplicationsRecord>>(
                                            stream: queryApplicationsRecord(
                                              parent: widget!.schoolSelected,
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
                                              List<ApplicationsRecord>
                                                  buttonApplicationsRecordList =
                                                  snapshot.data!;

                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  final firestoreBatch =
                                                      FirebaseFirestore.instance
                                                          .batch();
                                                  try {
                                                    var applicationsRecordReference =
                                                        ApplicationsRecord
                                                            .createDoc(widget!
                                                                .schoolSelected!);
                                                    firestoreBatch.set(
                                                        applicationsRecordReference,
                                                        createApplicationsRecordData(
                                                          student:
                                                              currentUserReference,
                                                          approved: false,
                                                        ));
                                                    _model.addedApplicaton =
                                                        ApplicationsRecord
                                                            .getDocumentFromData(
                                                                createApplicationsRecordData(
                                                                  student:
                                                                      currentUserReference,
                                                                  approved:
                                                                      false,
                                                                ),
                                                                applicationsRecordReference);

                                                    firestoreBatch.update(
                                                        widget!.schoolSelected!,
                                                        {
                                                          ...mapToFirestore(
                                                            {
                                                              'schoolApplications':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                    firestoreBatch.update(
                                                        currentUserReference!, {
                                                      ...mapToFirestore(
                                                        {
                                                          'Applications':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            _model
                                                                .addedApplicaton
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  } finally {
                                                    await firestoreBatch
                                                        .commit();
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Apply',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            PagedGridView<DocumentSnapshot<Object?>?,
                                SchoolEventsRecord>(
                              pagingController: _model.setGridViewController(
                                  SchoolEventsRecord.collection(
                                      widget!.schoolSelected),
                                  parent: widget!.schoolSelected),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<SchoolEventsRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
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

                                itemBuilder: (context, _, gridViewIndex) {
                                  final gridViewSchoolEventsRecord = _model
                                      .gridViewPagingController!
                                      .itemList![gridViewIndex];
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
                                          child: FlutterFlowExpandedImageView(
                                            image: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: functions.twickPicImagePath(
                                                  valueOrDefault<String>(
                                                    gridViewSchoolEventsRecord
                                                        .eventPoster
                                                        .firstOrNull,
                                                    'https://picsum.photos/seed/722/600',
                                                  ),
                                                  ' &twic=v1/resize=300/cover=1:1')!,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: functions.twickPicImagePath(
                                                valueOrDefault<String>(
                                                  gridViewSchoolEventsRecord
                                                      .eventPoster.firstOrNull,
                                                  'https://picsum.photos/seed/722/600' +
                                                      '$gridViewIndex',
                                                ),
                                                ' &twic=v1/resize=300/cover=1:1')!,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: functions.twickPicImagePath(
                                          valueOrDefault<String>(
                                            gridViewSchoolEventsRecord
                                                .eventPoster.firstOrNull,
                                            'https://picsum.photos/seed/722/600' +
                                                '$gridViewIndex',
                                          ),
                                          ' &twic=v1/resize=300/cover=1:1')!,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: functions.twickPicImagePath(
                                              valueOrDefault<String>(
                                                gridViewSchoolEventsRecord
                                                    .eventPoster.firstOrNull,
                                                'https://picsum.photos/seed/722/600',
                                              ),
                                              ' &twic=v1/resize=300/cover=1:1')!,
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation']!);
                                },
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
        );
      },
    );
  }
}
