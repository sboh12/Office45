import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/checkboks_element_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_applicants_model.dart';
export 'list_of_applicants_model.dart';

class ListOfApplicantsWidget extends StatefulWidget {
  const ListOfApplicantsWidget({super.key});

  static String routeName = 'ListOfApplicants';
  static String routePath = '/listOfApplicants';

  @override
  State<ListOfApplicantsWidget> createState() => _ListOfApplicantsWidgetState();
}

class _ListOfApplicantsWidgetState extends State<ListOfApplicantsWidget> {
  late ListOfApplicantsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfApplicantsModel());
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
      builder: (context) => StreamBuilder<List<ApplicationsRecord>>(
        stream: queryApplicationsRecord(
          parent: currentUserDocument?.schoolRegistered,
          queryBuilder: (applicationsRecord) => applicationsRecord.where(
            'Approved',
            isEqualTo: false,
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
          List<ApplicationsRecord> listOfApplicantsApplicationsRecordList =
              snapshot.data!;

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
                  'List of Applicants',
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
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Choose action',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      while (FFAppState().loopApplication <
                                          listOfApplicantsApplicationsRecordList
                                              .length) {
                                        if (_model.checkboksElementModels
                                            .getValueAtIndex(
                                          FFAppState().loopApplication,
                                          (m) => m.checkboxValue,
                                        )!) {
                                          await listOfApplicantsApplicationsRecordList
                                              .elementAtOrNull(
                                                  FFAppState().loopApplication)!
                                              .reference
                                              .update(
                                                  createApplicationsRecordData(
                                                comment: 'Re: Documents',
                                              ));
                                          FFAppState().loopApplication =
                                              FFAppState().loopApplication + 1;
                                        } else {
                                          FFAppState().loopApplication =
                                              FFAppState().loopApplication + 1;
                                        }
                                      }
                                      FFAppState().loopApplication = 0;
                                    },
                                    text: 'Re: Documents',
                                    options: FFButtonOptions(
                                      height: 25.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xC1295CFB),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
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
                                    while (FFAppState().loopApplication <
                                        listOfApplicantsApplicationsRecordList
                                            .length) {
                                      if (_model.checkboksElementModels
                                          .getValueAtIndex(
                                        FFAppState().loopApplication,
                                        (m) => m.checkboxValue,
                                      )!) {
                                        await listOfApplicantsApplicationsRecordList
                                            .elementAtOrNull(
                                                FFAppState().loopApplication)!
                                            .reference
                                            .update(
                                                createApplicationsRecordData(
                                              comment: 'Validating',
                                            ));
                                        FFAppState().loopApplication =
                                            FFAppState().loopApplication + 1;
                                      } else {
                                        FFAppState().loopApplication =
                                            FFAppState().loopApplication + 1;
                                      }
                                    }
                                    FFAppState().loopApplication = 0;
                                  },
                                  text: 'Validating',
                                  options: FFButtonOptions(
                                    height: 25.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
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
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    while (FFAppState().loopApplication <
                                        listOfApplicantsApplicationsRecordList
                                            .length) {
                                      if (_model.checkboksElementModels
                                          .getValueAtIndex(
                                        FFAppState().loopApplication,
                                        (m) => m.checkboxValue,
                                      )!) {
                                        await listOfApplicantsApplicationsRecordList
                                            .elementAtOrNull(
                                                FFAppState().loopApplication)!
                                            .reference
                                            .update(
                                                createApplicationsRecordData(
                                              comment: 'Reject',
                                            ));
                                        FFAppState().loopApplication =
                                            FFAppState().loopApplication + 1;
                                      } else {
                                        FFAppState().loopApplication =
                                            FFAppState().loopApplication + 1;
                                      }
                                    }
                                    FFAppState().loopApplication = 0;
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .customColor3,
                                    size: 34.0,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    while (FFAppState().loopApplication <
                                        listOfApplicantsApplicationsRecordList
                                            .length) {
                                      if (_model.checkboksElementModels
                                          .getValueAtIndex(
                                        FFAppState().loopApplication,
                                        (m) => m.checkboxValue,
                                      )!) {
                                        await listOfApplicantsApplicationsRecordList
                                            .elementAtOrNull(
                                                FFAppState().loopApplication)!
                                            .reference
                                            .update(
                                                createApplicationsRecordData(
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
                                        FFAppState().loopApplication =
                                            FFAppState().loopApplication + 1;
                                      } else {
                                        FFAppState().loopApplication =
                                            FFAppState().loopApplication + 1;
                                      }
                                    }
                                    FFAppState().loopApplication = 0;
                                    safeSetState(() {});
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
                        ),
                        Text(
                          'Filter items',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        FlutterFlowChoiceChips(
                          options: [
                            ChipData('Declined', Icons.close_sharp),
                            ChipData('Accepted'),
                            ChipData('Validating'),
                            ChipData('Re: Documents')
                          ],
                          onChanged: (val) => safeSetState(
                              () => _model.choiceChipsValue = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                        Builder(
                          builder: (context) {
                            final applicationsNotAccepted =
                                listOfApplicantsApplicationsRecordList.toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: applicationsNotAccepted.length,
                              itemBuilder:
                                  (context, applicationsNotAcceptedIndex) {
                                final applicationsNotAcceptedItem =
                                    applicationsNotAccepted[
                                        applicationsNotAcceptedIndex];
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 8.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                applicationsNotAcceptedItem
                                                    .student!),
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

                                              final rowUsersRecord =
                                                  snapshot.data!;

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .checkboksElementModels
                                                          .getModel(
                                                        applicationsNotAcceptedItem
                                                            .reference.id,
                                                        applicationsNotAcceptedIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          CheckboksElementWidget(
                                                        key: Key(
                                                          'Keyjqz_${applicationsNotAcceptedItem.reference.id}',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              rowUsersRecord
                                                                  .fullName,
                                                              maxLines: 10,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  rowUsersRecord
                                                                      .level,
                                                                  '0',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 12,
                                                                ),
                                                                maxLines: 20,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          8.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowUsersRecord
                                                                    .photoUrl,
                                                                'https://afropolitan.co.za/wp-content/uploads/2021/07/Simphiwe-dana-1.jpeg',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await applicationsNotAcceptedItem
                                                                .reference
                                                                .update(
                                                                    createApplicationsRecordData(
                                                              comment:
                                                                  'Re: Documents',
                                                            ));
                                                          },
                                                          text: 'Re: Documents',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 25.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              applicationsNotAcceptedItem
                                                                          .comment ==
                                                                      'Validating'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          await applicationsNotAcceptedItem
                                                              .reference
                                                              .update(
                                                                  createApplicationsRecordData(
                                                            comment:
                                                                'Validating',
                                                          ));
                                                        },
                                                        text: 'Validating',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 25.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: valueOrDefault<
                                                              Color>(
                                                            applicationsNotAcceptedItem.comment ==
                                                                    'Re: Documents'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          await applicationsNotAcceptedItem
                                                              .reference
                                                              .update(
                                                                  createApplicationsRecordData(
                                                            comment: 'Reject',
                                                          ));
                                                        },
                                                        child: Icon(
                                                          Icons.clear_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor3,
                                                          size: 34.0,
                                                        ),
                                                      ),
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
                                                          await applicationsNotAcceptedItem
                                                              .reference
                                                              .update(
                                                                  createApplicationsRecordData(
                                                            approved: true,
                                                            ucode:
                                                                valueOrDefault<
                                                                    String>(
                                                              random_data
                                                                  .randomString(
                                                                5,
                                                                5,
                                                                false,
                                                                false,
                                                                true,
                                                              ),
                                                              '00000',
                                                            ),
                                                          ));
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .done_all_rounded,
                                                          color:
                                                              Color(0xC1078129),
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
                                      ),
                                    ],
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
            ),
          );
        },
      ),
    );
  }
}
