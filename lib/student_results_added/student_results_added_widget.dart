import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enter_result_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'student_results_added_model.dart';
export 'student_results_added_model.dart';

class StudentResultsAddedWidget extends StatefulWidget {
  const StudentResultsAddedWidget({
    super.key,
    required this.subjectSelected,
    required this.activitySelected,
  });

  final DocumentReference? subjectSelected;
  final DocumentReference? activitySelected;

  static String routeName = 'studentResultsAdded';
  static String routePath = '/studentResultsAdded';

  @override
  State<StudentResultsAddedWidget> createState() =>
      _StudentResultsAddedWidgetState();
}

class _StudentResultsAddedWidgetState extends State<StudentResultsAddedWidget> {
  late StudentResultsAddedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentResultsAddedModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.summaryTextController ??= TextEditingController();
    _model.summaryFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

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
            'Student Mark',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.25,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Text(
                            'Students',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'SubjectRegistered',
                      arrayContains: widget!.subjectSelected,
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
                    List<UsersRecord> dropDownUsersRecordList = snapshot.data!
                        .where((u) => u.uid != currentUserUid)
                        .toList();

                    return FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: List<String>.from(
                          dropDownUsersRecordList.map((e) => e.email).toList()),
                      optionLabels: dropDownUsersRecordList
                          .map((e) => e.fullName)
                          .toList(),
                      onChanged: (val) async {
                        safeSetState(() => _model.dropDownValue = val);
                        _model.studentMark = await queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'email',
                            isEqualTo: _model.dropDownValue,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);

                        safeSetState(() {});
                      },
                      width: 300.0,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      hintText: 'Please select...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Container(
                    width: 150.0,
                    child: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Mark',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 10.0),
                  child: TextFormField(
                    controller: _model.summaryTextController,
                    focusNode: _model.summaryFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Comment',
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
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
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                        ),
                    maxLines: 5,
                    validator: _model.summaryTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    _model.added = await queryAnswersRecordCount(
                      parent: widget!.subjectSelected,
                      queryBuilder: (answersRecord) => answersRecord
                          .where(
                            'Student',
                            isEqualTo: _model.studentMark?.reference,
                          )
                          .where(
                            'ActivityRef',
                            isEqualTo: widget!.activitySelected,
                          ),
                    );
                    if (_model.added! > 0) {
                      _model.addedRef = await queryAnswersRecordOnce(
                        parent: widget!.subjectSelected,
                        queryBuilder: (answersRecord) => answersRecord
                            .where(
                              'Student',
                              isEqualTo: _model.studentMark?.reference,
                            )
                            .where(
                              'ActivityRef',
                              isEqualTo: widget!.activitySelected,
                            ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      await _model.addedRef!.reference.delete();

                      await widget!.activitySelected!
                          .update(createActivityRecordData());

                      await AnswersRecord.createDoc(widget!.subjectSelected!)
                          .set(createAnswersRecordData(
                        activityRef: widget!.activitySelected,
                        mark: int.tryParse(_model.textController1.text),
                        createdAt: getCurrentTimestamp,
                        student: _model.studentMark?.reference,
                        comment: _model.summaryTextController.text,
                      ));
                    } else {
                      await AnswersRecord.createDoc(widget!.subjectSelected!)
                          .set(createAnswersRecordData(
                        activityRef: widget!.activitySelected,
                        mark: int.tryParse(_model.textController1.text),
                        createdAt: getCurrentTimestamp,
                        student: _model.studentMark?.reference,
                        comment: _model.summaryTextController.text,
                      ));
                    }

                    safeSetState(() {});
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'SubjectRegistered',
                      arrayContains: widget!.subjectSelected,
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
                    List<UsersRecord> columnUsersRecordList = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnUsersRecordList.length,
                          (columnIndex) {
                        final columnUsersRecord =
                            columnUsersRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.24,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      border: Border.all(
                                        color: Color(0xFF307AE5),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        columnUsersRecord.fullName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.6,
                                          height: 90.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            border: Border.all(
                                              color: Color(0xFF307AE5),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<AnswersRecord>>(
                                              stream: queryAnswersRecord(
                                                parent: widget!.subjectSelected,
                                                queryBuilder: (answersRecord) =>
                                                    answersRecord
                                                        .where(
                                                          'ActivityRef',
                                                          isEqualTo: widget!
                                                              .activitySelected,
                                                        )
                                                        .where(
                                                          'Student',
                                                          isEqualTo:
                                                              columnUsersRecord
                                                                  .reference,
                                                        ),
                                                singleRecord: true,
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
                                                List<AnswersRecord>
                                                    columnAnswersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnAnswersRecord =
                                                    columnAnswersRecordList
                                                            .isNotEmpty
                                                        ? columnAnswersRecordList
                                                            .first
                                                        : null;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FlipCard(
                                                      fill: Fill.fillBack,
                                                      direction: FlipDirection
                                                          .HORIZONTAL,
                                                      speed: 400,
                                                      front: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                columnAnswersRecord!
                                                                    .mark
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            EnterResultWidget(
                                                              key: Key(
                                                                  'Key40r_${columnIndex}_of_${columnUsersRecordList.length}'),
                                                              answer:
                                                                  columnAnswersRecord!
                                                                      .reference,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      back: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            columnAnswersRecord!
                                                                .comment,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    border: Border.all(
                                      color: Color(0xFF307AE5),
                                    ),
                                  ),
                                  child: StreamBuilder<List<AnswersRecord>>(
                                    stream: queryAnswersRecord(
                                      parent: widget!.subjectSelected,
                                      queryBuilder: (answersRecord) =>
                                          answersRecord
                                              .where(
                                                'ActivityRef',
                                                isEqualTo:
                                                    widget!.activitySelected,
                                              )
                                              .where(
                                                'Student',
                                                isEqualTo:
                                                    columnUsersRecord.reference,
                                              ),
                                      singleRecord: true,
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
                                      List<AnswersRecord>
                                          columnAnswersRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final columnAnswersRecord =
                                          columnAnswersRecordList.isNotEmpty
                                              ? columnAnswersRecordList.first
                                              : null;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: () {
                                              if (columnAnswersRecord!.mark >
                                                  70) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if ((columnAnswersRecord!
                                                          .mark <=
                                                      70) &&
                                                  (columnAnswersRecord!.mark >=
                                                      40)) {
                                                return Color(0xFFBC3F08);
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .error;
                                              }
                                            }(),
                                            size: 40.0,
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
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
