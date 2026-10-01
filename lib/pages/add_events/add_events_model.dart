import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/gemini/gemini.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'add_events_widget.dart' show AddEventsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddEventsModel extends FlutterFlowModel<AddEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AddEvents widget.
  SchoolRecord? mySchool;
  bool isDataUploading_uploadedPosters = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadedPosters = [];
  List<String> uploadedFileUrls_uploadedPosters = [];

  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? errorImage;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SchoolEventsRecord? outputx;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for Datesa widget.
  FocusNode? datesaFocusNode;
  TextEditingController? datesaTextController;
  String? Function(BuildContext, String?)? datesaTextControllerValidator;
  // State field(s) for EventContent widget.
  FocusNode? eventContentFocusNode;
  TextEditingController? eventContentTextController;
  String? Function(BuildContext, String?)? eventContentTextControllerValidator;
  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? textGenerated;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    datesaFocusNode?.dispose();
    datesaTextController?.dispose();

    eventContentFocusNode?.dispose();
    eventContentTextController?.dispose();
  }
}
