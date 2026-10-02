import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/pass_rate_form_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'principal_dash_model.dart';
export 'principal_dash_model.dart';

class PrincipalDashWidget extends StatefulWidget {
  const PrincipalDashWidget({super.key});

  static String routeName = 'PrincipalDash';
  static String routePath = '/principalDash';

  @override
  State<PrincipalDashWidget> createState() => _PrincipalDashWidgetState();
}

class _PrincipalDashWidgetState extends State<PrincipalDashWidget>
    with TickerProviderStateMixin {
  late PrincipalDashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrincipalDashModel());

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.switchValue = true;
    _model.tabBarController2 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<SubjectsRecord>>(
        stream: querySubjectsRecord(
          queryBuilder: (subjectsRecord) => subjectsRecord.where(
            'schoolSubject',
            isEqualTo: currentUserDocument?.schoolRegistered,
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
          List<SubjectsRecord> principalDashSubjectsRecordList = snapshot.data!;

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
                  'Part Dashboard',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: !FlutterFlowTheme.of(context)
                            .headlineMediumIsCustom,
                      ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          EditSchoolWidget.routeName,
                          queryParameters: {
                            'selectedSchool': serializeParam(
                              currentUserDocument?.schoolRegistered,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 400),
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 34.0,
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
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            width: 100.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: Color(0xFF1F82E7),
                                width: 3.0,
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        child:
                                                            PassRateFormWidget(
                                                          school: currentUserDocument!
                                                              .schoolRegistered!,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Text(
                                            'School',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            principalDashSubjectsRecordList
                                                .length
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        StreamBuilder<SchoolRecord>(
                                          stream: SchoolRecord.getDocument(
                                              currentUserDocument!
                                                  .schoolPrincipal!),
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

                                            final textSchoolRecord =
                                                snapshot.data!;

                                            return Text(
                                              textSchoolRecord.enrollment
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            );
                                          },
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              DashboardSchoolWidget.routeName,
                                              queryParameters: {
                                                'schoolSelected':
                                                    serializeParam(
                                                  currentUserDocument
                                                      ?.schoolRegistered,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ),
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.tips_and_updates,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.43,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                              unselectedLabelStyle: TextStyle(),
                                              indicatorColor: Color(0xC1078129),
                                              padding: EdgeInsets.all(4.0),
                                              tabs: [
                                                Tab(
                                                  text: 'Grade 12',
                                                ),
                                                Tab(
                                                  text: 'Grade 11',
                                                ),
                                                Tab(
                                                  text: 'Grade 10',
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController1,
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
                                                  _model.tabBarController1,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              children: [
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .dropDownValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options: principalDashSubjectsRecordList
                                                                .where((e) =>
                                                                    e.level ==
                                                                    'Grade 12')
                                                                .toList()
                                                                .map((e) => e
                                                                    .subjectName)
                                                                .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.dropDownValue =
                                                                      val);
                                                              _model.answersAssignment =
                                                                  await queryAnswersRecordOnce(
                                                                parent: principalDashSubjectsRecordList
                                                                    .where((e) =>
                                                                        (e.subjectName ==
                                                                            _model
                                                                                .dropDownValue) &&
                                                                        (e.level ==
                                                                            'Grade 12'))
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.reference,
                                                                queryBuilder: (answersRecord) =>
                                                                    answersRecord
                                                                        .orderBy(
                                                                            'created_at'),
                                                              );
                                                              _model.activities =
                                                                  await queryActivityRecordOnce(
                                                                parent: principalDashSubjectsRecordList
                                                                    .where((e) =>
                                                                        (e.subjectName ==
                                                                            _model
                                                                                .dropDownValue) &&
                                                                        (e.level ==
                                                                            'Grade 12'))
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.reference,
                                                                queryBuilder:
                                                                    (activityRecord) =>
                                                                        activityRecord
                                                                            .where(
                                                                  'ActivityType',
                                                                  isEqualTo: _model
                                                                      .choiceChipsValue,
                                                                ),
                                                              );
                                                              FFAppState()
                                                                  .CountGraph = 0;
                                                              FFAppState()
                                                                  .ResultAv = [];
                                                              while (FFAppState()
                                                                      .CountGraph <
                                                                  valueOrDefault<
                                                                      int>(
                                                                    _model
                                                                        .activities
                                                                        ?.length,
                                                                    0,
                                                                  )) {
                                                                FFAppState()
                                                                    .addToResultAv(
                                                                        valueOrDefault<
                                                                            int>(
                                                                  functions.averageList(_model
                                                                      .answersAssignment
                                                                      ?.where((e) =>
                                                                          e.activityRef ==
                                                                          _model
                                                                              .activities
                                                                              ?.elementAtOrNull(FFAppState()
                                                                                  .CountGraph)
                                                                              ?.reference)
                                                                      .toList()
                                                                      ?.map((e) =>
                                                                          valueOrDefault<
                                                                              int>(
                                                                            e.mark,
                                                                            0,
                                                                          ))
                                                                      .toList()
                                                                      ?.toList()),
                                                                  0,
                                                                ));
                                                                FFAppState()
                                                                        .CountGraph =
                                                                    FFAppState()
                                                                            .CountGraph +
                                                                        1;
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            width: 300.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                'Please select subject',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                          Switch.adaptive(
                                                            value: _model
                                                                .switchValue!,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchValue =
                                                                      newValue!);
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            activeTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            inactiveTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            inactiveThumbColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                          FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  'Test',
                                                                  Icons
                                                                      .textsms),
                                                              ChipData(
                                                                  'Assignment',
                                                                  Icons
                                                                      .calendar_today),
                                                              ChipData(
                                                                  'Exam',
                                                                  FontAwesomeIcons
                                                                      .paperclip.data)
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValue =
                                                                        val?.firstOrNull),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              iconSize: 18.0,
                                                              elevation: 4.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              iconSize: 18.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            chipSpacing: 12.0,
                                                            rowSpacing: 12.0,
                                                            multiselect: false,
                                                            initialized: _model
                                                                    .choiceChipsValue !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .center,
                                                            controller: _model
                                                                    .choiceChipsValueController ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              ['Assignment'],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                          if (_model.dropDownValue !=
                                                                  null &&
                                                              _model.dropDownValue !=
                                                                  '')
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.223,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (_model
                                                                          .switchValue ??
                                                                      true)
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.9,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.2,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              FlutterFlowLineChart(
                                                                            data: [
                                                                              FFLineChartData(
                                                                                xData: _model.answersAssignment!.map((d) => d.createdAt).toList(),
                                                                                yData: _model.answersAssignment!.map((d) => d.mark).toList(),
                                                                                settings: LineChartBarData(
                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                  barWidth: 2.0,
                                                                                  isCurved: true,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            chartStylingInfo:
                                                                                ChartStylingInfo(
                                                                              enableTooltip: true,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              showGrid: true,
                                                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              borderWidth: 1.0,
                                                                            ),
                                                                            axisBounds:
                                                                                AxisBounds(
                                                                              minY: 0.0,
                                                                              maxY: 100.0,
                                                                            ),
                                                                            xAxisLabelInfo:
                                                                                AxisLabelInfo(
                                                                              title: 'las 30 days',
                                                                              titleTextStyle: TextStyle(
                                                                                fontSize: 14.0,
                                                                              ),
                                                                            ),
                                                                            yAxisLabelInfo:
                                                                                AxisLabelInfo(
                                                                              title: 'Class Average',
                                                                              titleTextStyle: TextStyle(
                                                                                fontSize: 14.0,
                                                                              ),
                                                                              showLabels: true,
                                                                              labelInterval: 10.0,
                                                                              labelFormatter: LabelFormatter(
                                                                                numberFormat: (val) => val.toString(),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (!_model
                                                                      .switchValue!)
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.9,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.45,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              FlutterFlowBarChart(
                                                                                barData: [
                                                                                  FFBarChartData(
                                                                                    yData: FFAppState().ResultAv,
                                                                                    color: Color(0xFF6F28CB),
                                                                                  )
                                                                                ],
                                                                                xLabels: _model.activities!.map((e) => e.name).toList(),
                                                                                barWidth: 25.0,
                                                                                barBorderRadius: BorderRadius.circular(8.0),
                                                                                groupSpace: 45.0,
                                                                                alignment: BarChartAlignment.spaceBetween,
                                                                                chartStylingInfo: ChartStylingInfo(
                                                                                  enableTooltip: true,
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  showGrid: true,
                                                                                  borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  borderWidth: 1.0,
                                                                                ),
                                                                                axisBounds: AxisBounds(
                                                                                  minY: 0.0,
                                                                                  maxY: 100.0,
                                                                                ),
                                                                                xAxisLabelInfo: AxisLabelInfo(
                                                                                  title: 'Average Activities',
                                                                                  titleTextStyle: TextStyle(
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                  showLabels: true,
                                                                                  labelTextStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        fontSize: 9.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                      ),
                                                                                  labelInterval: 10.0,
                                                                                ),
                                                                                yAxisLabelInfo: AxisLabelInfo(
                                                                                  title: 'Class Average',
                                                                                  titleTextStyle: TextStyle(
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                  showLabels: true,
                                                                                  labelInterval: 10.0,
                                                                                  labelFormatter: LabelFormatter(
                                                                                    numberFormat: (val) => val.toString(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                child: FlutterFlowChartLegendWidget(
                                                                                  entries: [
                                                                                    LegendEntry(Color(0xFF6F28CB), 'Activies'),
                                                                                  ],
                                                                                  width: 100.0,
                                                                                  height: 50.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                  textPadding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                  borderWidth: 1.0,
                                                                                  borderColor: Colors.black,
                                                                                  indicatorSize: 10.0,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .grade11DropdownValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options:
                                                            principalDashSubjectsRecordList
                                                                .where((e) =>
                                                                    e.level ==
                                                                    'Grade 11')
                                                                .toList()
                                                                .map((e) => e
                                                                    .subjectName)
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.grade11DropdownValue =
                                                                  val);
                                                          _model.answersGrade11 =
                                                              await queryAnswersRecordOnce(
                                                            parent: principalDashSubjectsRecordList
                                                                .where((e) =>
                                                                    (e.subjectName ==
                                                                        _model
                                                                            .grade11DropdownValue) &&
                                                                    (e.level ==
                                                                        'Grade 11'))
                                                                .toList()
                                                                .firstOrNull
                                                                ?.reference,
                                                            queryBuilder:
                                                                (answersRecord) =>
                                                                    answersRecord
                                                                        .orderBy(
                                                                            'created_at'),
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        width: 300.0,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            'Please select subject',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                      if (_model.grade11DropdownValue !=
                                                              null &&
                                                          _model.grade11DropdownValue !=
                                                              '')
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.45,
                                                              child:
                                                                  FlutterFlowLineChart(
                                                                data: [
                                                                  FFLineChartData(
                                                                    xData: _model
                                                                        .answersGrade11!
                                                                        .map((d) =>
                                                                            d.createdAt)
                                                                        .toList(),
                                                                    yData: _model
                                                                        .answersGrade11!
                                                                        .map((d) =>
                                                                            d.mark)
                                                                        .toList(),
                                                                    settings:
                                                                        LineChartBarData(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      barWidth:
                                                                          2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                chartStylingInfo:
                                                                    ChartStylingInfo(
                                                                  enableTooltip:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  showGrid:
                                                                      true,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  borderWidth:
                                                                      1.0,
                                                                ),
                                                                axisBounds:
                                                                    AxisBounds(
                                                                  minY: 0.0,
                                                                  maxY: 100.0,
                                                                ),
                                                                xAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      'las 30 days',
                                                                  titleTextStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                yAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      'Class Average',
                                                                  titleTextStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                  showLabels:
                                                                      true,
                                                                  labelInterval:
                                                                      10.0,
                                                                  labelFormatter:
                                                                      LabelFormatter(
                                                                    numberFormat:
                                                                        (val) =>
                                                                            val.toString(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .grade10DropdownValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options:
                                                            principalDashSubjectsRecordList
                                                                .where((e) =>
                                                                    e.level ==
                                                                    'Grade 10')
                                                                .toList()
                                                                .map((e) => e
                                                                    .subjectName)
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.grade10DropdownValue =
                                                                  val);
                                                          _model.answersGrade10 =
                                                              await queryAnswersRecordOnce(
                                                            parent: principalDashSubjectsRecordList
                                                                .where((e) =>
                                                                    (e.subjectName ==
                                                                        _model
                                                                            .grade10DropdownValue) &&
                                                                    (e.level ==
                                                                        'Grade 10'))
                                                                .toList()
                                                                .firstOrNull
                                                                ?.reference,
                                                            queryBuilder:
                                                                (answersRecord) =>
                                                                    answersRecord
                                                                        .orderBy(
                                                                            'created_at'),
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        width: 300.0,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            'Please select subject',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                      if (_model.grade10DropdownValue !=
                                                              null &&
                                                          _model.grade10DropdownValue !=
                                                              '')
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.45,
                                                              child:
                                                                  FlutterFlowLineChart(
                                                                data: [
                                                                  FFLineChartData(
                                                                    xData: _model
                                                                        .answersGrade10!
                                                                        .map((d) =>
                                                                            d.createdAt)
                                                                        .toList(),
                                                                    yData: _model
                                                                        .answersGrade10!
                                                                        .map((d) =>
                                                                            d.mark)
                                                                        .toList(),
                                                                    settings:
                                                                        LineChartBarData(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      barWidth:
                                                                          2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                chartStylingInfo:
                                                                    ChartStylingInfo(
                                                                  enableTooltip:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  showGrid:
                                                                      true,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  borderWidth:
                                                                      1.0,
                                                                ),
                                                                axisBounds:
                                                                    AxisBounds(
                                                                  minY: 0.0,
                                                                  maxY: 100.0,
                                                                ),
                                                                xAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      'las 30 days',
                                                                  titleTextStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                yAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      'Class Average',
                                                                  titleTextStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                  showLabels:
                                                                      true,
                                                                  labelInterval:
                                                                      10.0,
                                                                  labelFormatter:
                                                                      LabelFormatter(
                                                                    numberFormat:
                                                                        (val) =>
                                                                            val.toString(),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onDoubleTap: () async {
                                        context.pushNamed(
                                            ListOfApplicantsWidget.routeName);
                                      },
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                              unselectedLabelStyle: TextStyle(),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              padding: EdgeInsets.all(4.0),
                                              tabs: [
                                                Tab(
                                                  text: 'Applications',
                                                ),
                                                Tab(
                                                  text: 'Learners',
                                                ),
                                                Tab(
                                                  text: 'Staff',
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController2,
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
                                                  _model.tabBarController2,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: StreamBuilder<
                                                      List<ApplicationsRecord>>(
                                                    stream:
                                                        queryApplicationsRecord(
                                                      parent: currentUserDocument
                                                          ?.schoolRegistered,
                                                      queryBuilder:
                                                          (applicationsRecord) =>
                                                              applicationsRecord
                                                                  .where(
                                                        'Approved',
                                                        isEqualTo: false,
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
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: Color(
                                                                  0xC1295CFB),
                                                              size: 80.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ApplicationsRecord>
                                                          columnApplicationsRecordList =
                                                          snapshot.data!;

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnApplicationsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnApplicationsRecord =
                                                                columnApplicationsRecordList[
                                                                    columnIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: StreamBuilder<
                                                                    UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          columnApplicationsRecord
                                                                              .student!),
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

                                                                    final rowUsersRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 12.0),
                                                                                child: Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: Duration(milliseconds: 500),
                                                                                    fadeOutDuration: Duration(milliseconds: 500),
                                                                                    imageUrl: valueOrDefault<String>(
                                                                                      functions.twickPicImagePath(rowUsersRecord.photoUrl, '&twic=v1/resize=80/cover=1:1'),
                                                                                      'https://yt3.googleusercontent.com/qtLoSGi6EpmAHj4AbbPMVVt9PHE2Em5ZAdM2ZbKrmnZS1pjnjt4bCDIj-QRUM00mdHshsExZZg=s900-c-k-c0x00ffffff-no-rj',
                                                                                    ),
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: Text(
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
                                                                                    maxChars: 15,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 8.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      rowUsersRecord.level,
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await columnApplicationsRecord.reference.update(createApplicationsRecordData(
                                                                                    comment: 'Re: Documents',
                                                                                  ));
                                                                                },
                                                                                text: 'Re: Documents',
                                                                                options: FFButtonOptions(
                                                                                  height: 25.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: valueOrDefault<Color>(
                                                                                    columnApplicationsRecord.comment == 'Validating' ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                      ),
                                                                                  elevation: 3.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await columnApplicationsRecord.reference.update(createApplicationsRecordData(
                                                                                  comment: 'Validating',
                                                                                ));
                                                                              },
                                                                              text: 'Validating',
                                                                              options: FFButtonOptions(
                                                                                height: 25.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: valueOrDefault<Color>(
                                                                                  columnApplicationsRecord.comment == 'Re: Documents' ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                    ),
                                                                                elevation: 3.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await columnApplicationsRecord.reference.update(createApplicationsRecordData(
                                                                                  comment: 'Reject',
                                                                                ));
                                                                              },
                                                                              child: Icon(
                                                                                Icons.clear_rounded,
                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                size: 34.0,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await columnApplicationsRecord.reference.update(createApplicationsRecordData(
                                                                                  approved: true,
                                                                                  ucode: valueOrDefault<String>(
                                                                                    random_data.randomString(
                                                                                      5,
                                                                                      5,
                                                                                      false,
                                                                                      false,
                                                                                      true,
                                                                                    ),
                                                                                    '00000',
                                                                                  ),
                                                                                ));
                                                                                triggerPushNotification(
                                                                                  notificationTitle: 'Application Approved',
                                                                                  notificationText: 'Applocation using office45 has been approved use OTP code ${columnApplicationsRecord.ucode}to choose subjects. Make sure you have selected your grade before you enter the code',
                                                                                  notificationSound: 'default',
                                                                                  userRefs: [
                                                                                    rowUsersRecord.reference
                                                                                  ],
                                                                                  initialPageName: 'newprofile',
                                                                                  parameterData: {},
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.done_all_rounded,
                                                                                color: Color(0xC1078129),
                                                                                size: 34.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      8.0,
                                                                      12.0,
                                                                      8.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xC14B62A7),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .search_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .btnText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController1,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode1,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.textController1',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            context.pushNamed(
                                                                              UsersListWidget.routeName,
                                                                              queryParameters: {
                                                                                'isTeacher': serializeParam(
                                                                                  false,
                                                                                  ParamType.bool,
                                                                                ),
                                                                                'searchName': serializeParam(
                                                                                  _model.textController1.text,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                        ),
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'Search...',
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        validator: _model
                                                                            .textController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            List<UsersRecord>>(
                                                          stream:
                                                              queryUsersRecord(
                                                            queryBuilder:
                                                                (usersRecord) =>
                                                                    usersRecord
                                                                        .where(
                                                                          'schoolRegistered',
                                                                          isEqualTo:
                                                                              currentUserDocument?.schoolRegistered,
                                                                        )
                                                                        .where(
                                                                          'Teacher',
                                                                          isEqualTo:
                                                                              false,
                                                                        ),
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
                                                            List<UsersRecord>
                                                                listViewUsersRecordList =
                                                                snapshot.data!
                                                                    .where((u) =>
                                                                        u.uid !=
                                                                        currentUserUid)
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
                                                                  listViewUsersRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewUsersRecord =
                                                                    listViewUsersRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        NewprofileUserWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'user':
                                                                              serializeParam(
                                                                            listViewUsersRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 12.0),
                                                                                child: Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    listViewUsersRecord.photoUrl,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                child: Text(
                                                                                  listViewUsersRecord.fullName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    listViewUsersRecord.level,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
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
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xC14B62A7),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .search_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .btnText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController2,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode2,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController2',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () async {
                                                                        context
                                                                            .pushNamed(
                                                                          UsersListWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'isTeacher':
                                                                                serializeParam(
                                                                              true,
                                                                              ParamType.bool,
                                                                            ),
                                                                            'searchName':
                                                                                serializeParam(
                                                                              _model.textController2.text,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                    ),
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Search...',
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
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
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
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
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
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
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
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
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    validator: _model
                                                                        .textController2Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                                      'schoolRegistered',
                                                                      isEqualTo:
                                                                          currentUserDocument
                                                                              ?.schoolRegistered,
                                                                    )
                                                                    .where(
                                                                      'Teacher',
                                                                      isEqualTo:
                                                                          true,
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
                                                              child:
                                                                  SpinKitPumpingHeart(
                                                                color: Color(
                                                                    0xC1295CFB),
                                                                size: 80.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            listViewUsersRecordList =
                                                            snapshot.data!
                                                                .where((u) =>
                                                                    u.uid !=
                                                                    currentUserUid)
                                                                .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewUsersRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewUsersRecord =
                                                                listViewUsersRecordList[
                                                                    listViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
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
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    NewprofileUserWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'user':
                                                                          serializeParam(
                                                                        listViewUsersRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                Container(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                listViewUsersRecord.photoUrl,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              listViewUsersRecord.fullName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                listViewUsersRecord.level,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
