import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'apload_notes_model.dart';
export 'apload_notes_model.dart';

class AploadNotesWidget extends StatefulWidget {
  const AploadNotesWidget({
    super.key,
    required this.subjectAdded,
  });

  final DocumentReference? subjectAdded;

  static String routeName = 'AploadNotes';
  static String routePath = '/aploadNotes';

  @override
  State<AploadNotesWidget> createState() => _AploadNotesWidgetState();
}

class _AploadNotesWidgetState extends State<AploadNotesWidget> {
  late AploadNotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AploadNotesModel());

    _model.notesNameTextController ??= TextEditingController();
    _model.notesNameFocusNode ??= FocusNode();

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
    context.watch<FFAppState>();

    return StreamBuilder<SubjectsRecord>(
      stream: SubjectsRecord.getDocument(widget!.subjectAdded!),
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

        final aploadNotesSubjectsRecord = snapshot.data!;

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
                aploadNotesSubjectsRecord.subjectName,
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
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Color(0xFF1F82E7),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.notesNameTextController,
                              focusNode: _model.notesNameFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Notes Name',
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                              validator: _model.notesNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.summaryTextController,
                          focusNode: _model.summaryFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Summary',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyLargeIsCustom,
                              ),
                          maxLines: 5,
                          validator: _model.summaryTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Color(0xFF1F82E7),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 25.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model
                                            .uploadedFileUrls_uploadNotes.length
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              if (!FFAppState().openPdf)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Color(0xFF1F82E7),
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Color(0xFF1F82E7),
                                    icon: Icon(
                                      Icons.attach_file,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      FFAppState().openImage = true;
                                      safeSetState(() {});
                                      final selectedFiles = await selectFiles(
                                        allowedExtensions: ['pdf'],
                                        multiFile: true,
                                      );
                                      if (selectedFiles != null) {
                                        safeSetState(() =>
                                            _model.isDataUploading_uploadNotes =
                                                true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedFiles
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedFiles.map(
                                              (f) async => await uploadData(
                                                  f.storagePath, f.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading_uploadNotes =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedFiles.length &&
                                            downloadUrls.length ==
                                                selectedFiles.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFiles_uploadNotes =
                                                selectedUploadedFiles;
                                            _model.uploadedFileUrls_uploadNotes =
                                                downloadUrls;
                                          });
                                          showUploadMessage(
                                            context,
                                            'Success!',
                                          );
                                        } else {
                                          safeSetState(() {});
                                          showUploadMessage(
                                            context,
                                            'Failed to upload file',
                                          );
                                          return;
                                        }
                                      }
                                    },
                                  ),
                                ),
                              if (!FFAppState().openImage)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Color(0xFF1F82E7),
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Color(0xFF1F82E7),
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      FFAppState().openPdf = true;
                                      safeSetState(() {});
                                      final selectedMedia = await selectMedia(
                                        imageQuality: 73,
                                        mediaSource: MediaSource.photoGallery,
                                        multiImage: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading_notesUplozf =
                                                true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading_notesUplozf =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFiles_notesUplozf =
                                                selectedUploadedFiles;
                                            _model.uploadedFileUrls_notesUplozf =
                                                downloadUrls;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          safeSetState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 0.0),
                            child: StreamBuilder<List<StudentSubjectsRecord>>(
                              stream: queryStudentSubjectsRecord(
                                parent: widget!.subjectAdded,
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
                                List<StudentSubjectsRecord>
                                    containerStudentSubjectsRecordList =
                                    snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      if (_model.notesNameTextController.text !=
                                              null &&
                                          _model.notesNameTextController.text !=
                                              '') {
                                        if (_model.uploadedFileUrls_uploadNotes
                                                .length >
                                            0) {
                                          firestoreBatch.set(
                                              NotesRecord.createDoc(
                                                  widget!.subjectAdded!),
                                              {
                                                ...createNotesRecordData(
                                                  notesName: _model
                                                      .notesNameTextController
                                                      .text,
                                                  summary: _model
                                                      .summaryTextController
                                                      .text,
                                                  author: currentUserReference,
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'NotesFile': _model
                                                        .uploadedFileUrls_uploadNotes,
                                                  },
                                                ),
                                              });
                                          safeSetState(() {
                                            _model.isDataUploading_uploadNotes =
                                                false;
                                            _model.uploadedLocalFiles_uploadNotes =
                                                [];
                                            _model.uploadedFileUrls_uploadNotes =
                                                [];
                                          });

                                          FFAppState().subjectUsers = 0;
                                          safeSetState(() {
                                            _model.notesNameTextController
                                                ?.clear();
                                            _model.summaryTextController
                                                ?.clear();
                                          });
                                          context.safePop();
                                          FFAppState().openPdf = false;
                                          FFAppState().openImage = false;
                                          safeSetState(() {});
                                          triggerPushNotification(
                                            notificationTitle:
                                                valueOrDefault<String>(
                                              'New Notes - ${aploadNotesSubjectsRecord.subjectName}',
                                              'New Notes',
                                            ),
                                            notificationText:
                                                valueOrDefault<String>(
                                              _model
                                                  .notesNameTextController.text,
                                              'N/A',
                                            ),
                                            notificationSound: 'default',
                                            userRefs:
                                                containerStudentSubjectsRecordList
                                                    .map((e) =>
                                                        e.selectedStudents)
                                                    .withoutNulls
                                                    .toList(),
                                            initialPageName: 'subjectTasks',
                                            parameterData: {
                                              'subject':
                                                  aploadNotesSubjectsRecord
                                                      .reference,
                                            },
                                          );
                                        } else {
                                          if (_model
                                                  .uploadedFileUrls_notesUplozf
                                                  .length >
                                              0) {
                                            firestoreBatch.set(
                                                NotesRecord.createDoc(
                                                    widget!.subjectAdded!),
                                                {
                                                  ...createNotesRecordData(
                                                    notesName: _model
                                                        .notesNameTextController
                                                        .text,
                                                    summary: _model
                                                        .summaryTextController
                                                        .text,
                                                    author:
                                                        currentUserReference,
                                                    createdAt:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'NoteImages': _model
                                                          .uploadedFileUrls_notesUplozf,
                                                    },
                                                  ),
                                                });
                                            safeSetState(() {
                                              _model.isDataUploading_uploadNotes =
                                                  false;
                                              _model.uploadedLocalFiles_uploadNotes =
                                                  [];
                                              _model.uploadedFileUrls_uploadNotes =
                                                  [];
                                            });

                                            FFAppState().subjectUsers = 0;
                                            safeSetState(() {
                                              _model.notesNameTextController
                                                  ?.clear();
                                              _model.summaryTextController
                                                  ?.clear();
                                            });
                                            context.safePop();
                                            FFAppState().openPdf = false;
                                            FFAppState().openImage = false;
                                            safeSetState(() {});
                                            triggerPushNotification(
                                              notificationTitle:
                                                  valueOrDefault<String>(
                                                'New Notes - ${aploadNotesSubjectsRecord.subjectName}',
                                                'New Notes',
                                              ),
                                              notificationText:
                                                  valueOrDefault<String>(
                                                _model.notesNameTextController
                                                    .text,
                                                'N/A',
                                              ),
                                              notificationSound: 'default',
                                              userRefs:
                                                  containerStudentSubjectsRecordList
                                                      .map((e) =>
                                                          e.selectedStudents)
                                                      .withoutNulls
                                                      .toList(),
                                              initialPageName: 'subjectTasks',
                                              parameterData: {
                                                'subject':
                                                    aploadNotesSubjectsRecord
                                                        .reference,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Error, Please add media',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            FFAppState().openPdf = false;
                                            FFAppState().openImage = false;
                                            safeSetState(() {});
                                          }
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Error, Please add some values, files etc',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor3,
                                          ),
                                        );
                                      }

                                      FFAppState().openPdf = false;
                                      FFAppState().openImage = false;
                                      safeSetState(() {});
                                    } finally {
                                      await firestoreBatch.commit();
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Color(0xFF00FF46),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Submit',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    ),
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
            ),
          ),
        );
      },
    );
  }
}
