import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'school_code_model.dart';
export 'school_code_model.dart';

class SchoolCodeWidget extends StatefulWidget {
  const SchoolCodeWidget({
    super.key,
    required this.schoolURL,
  });

  final DocumentReference? schoolURL;

  static String routeName = 'SchoolCode';
  static String routePath = '/schoolCode';

  @override
  State<SchoolCodeWidget> createState() => _SchoolCodeWidgetState();
}

class _SchoolCodeWidgetState extends State<SchoolCodeWidget> {
  late SchoolCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchoolCodeModel());

    _model.pinCodeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApplicationsRecord>>(
      future: queryApplicationsRecordOnce(
        parent: widget!.schoolURL,
        queryBuilder: (applicationsRecord) => applicationsRecord.where(
          'Student',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<ApplicationsRecord> schoolCodeApplicationsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: true,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 34.0,
                ),
              ),
              title: Text(
                'Enter School Code',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<SchoolRecord>(
                stream: SchoolRecord.getDocument(widget!.schoolURL!),
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

                  final columnSchoolRecord = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Given by your school',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .headlineSmallIsCustom,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  44.0, 8.0, 44.0, 0.0),
                              child: Text(
                                'This code helps keep your account safe and secure.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: functions.twickPicImagePath(
                                    columnSchoolRecord.image,
                                    ' &twic=v1/resize=300/cover=1:1')!,
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: PinCodeTextField(
                                autoDisposeControllers: false,
                                appContext: context,
                                length: 5,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                enableActiveFill: false,
                                autoFocus: true,
                                focusNode: _model.pinCodeFocusNode,
                                enablePinAutofill: false,
                                errorTextSpace: 0.0,
                                showCursor: true,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                obscureText: false,
                                hintCharacter: '?',
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  fieldHeight: 60.0,
                                  fieldWidth: 60.0,
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  shape: PinCodeFieldShape.box,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  selectedColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                controller: _model.pinCodeController,
                                onChanged: (_) {},
                                onCompleted: (_) async {
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (schoolCodeApplicationsRecordList
                                            .firstOrNull?.ucode ==
                                        valueOrDefault<String>(
                                          _model.pinCodeController!.text,
                                          '00000',
                                        )) {
                                      _model.registered =
                                          await queryStudentsRecordCount(
                                        parent: widget!.schoolURL,
                                        queryBuilder: (studentsRecord) =>
                                            studentsRecord.where(
                                          'user',
                                          isEqualTo: currentUserReference,
                                        ),
                                      );
                                      if (_model.registered! <= 0) {
                                        firestoreBatch
                                            .update(widget!.schoolURL!, {
                                          ...mapToFirestore(
                                            {
                                              'SchoolStudents':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                              'Enrollment':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });

                                        firestoreBatch.set(
                                            StudentsRecord.createDoc(
                                                widget!.schoolURL!),
                                            createStudentsRecordData(
                                              studentName:
                                                  currentUserDisplayName,
                                              grade: valueOrDefault(
                                                  currentUserDocument?.level,
                                                  ''),
                                              user: currentUserReference,
                                            ));

                                        firestoreBatch
                                            .update(currentUserReference!, {
                                          ...createUsersRecordData(
                                            schoolEmail:
                                                columnSchoolRecord.email,
                                            teacher: false,
                                            schoolRegistered:
                                                columnSchoolRecord.reference,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'Applications':
                                                  FieldValue.arrayRemove([
                                                schoolCodeApplicationsRecordList
                                                    .firstOrNull?.reference
                                              ]),
                                            },
                                          ),
                                        });

                                        firestoreBatch.update(
                                            columnSchoolRecord.reference, {
                                          ...mapToFirestore(
                                            {
                                              'schoolApplications':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                        firestoreBatch.delete(
                                            schoolCodeApplicationsRecordList
                                                .firstOrNull!.reference);

                                        context.pushNamed(
                                            ItemsSubjectsWidget.routeName);
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Error'),
                                                content:
                                                    Text('Already enrolled'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                        context.pushNamed(
                                            ItemsSubjectsWidget.routeName);
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Error'),
                                              content: Text('Wrong Passcode'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  safeSetState(() {});
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: _model.pinCodeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 44.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Confirm & Continue',
                          options: FFButtonOptions(
                            width: 270.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
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
