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
import 'apload_notes_widget.dart' show AploadNotesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AploadNotesModel extends FlutterFlowModel<AploadNotesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for notesName widget.
  FocusNode? notesNameFocusNode;
  TextEditingController? notesNameTextController;
  String? Function(BuildContext, String?)? notesNameTextControllerValidator;
  // State field(s) for Summary widget.
  FocusNode? summaryFocusNode;
  TextEditingController? summaryTextController;
  String? Function(BuildContext, String?)? summaryTextControllerValidator;
  bool isDataUploading_uploadNotes = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadNotes = [];
  List<String> uploadedFileUrls_uploadNotes = [];

  bool isDataUploading_notesUplozf = false;
  List<FFUploadedFile> uploadedLocalFiles_notesUplozf = [];
  List<String> uploadedFileUrls_notesUplozf = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    notesNameFocusNode?.dispose();
    notesNameTextController?.dispose();

    summaryFocusNode?.dispose();
    summaryTextController?.dispose();
  }
}
