import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'add_resources_widget.dart' show AddResourcesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddResourcesModel extends FlutterFlowModel<AddResourcesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for activityName widget.
  FocusNode? activityNameFocusNode;
  TextEditingController? activityNameTextController;
  String? Function(BuildContext, String?)? activityNameTextControllerValidator;
  bool isDataUploading_uploadExam = false;
  FFUploadedFile uploadedLocalFile_uploadExam =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadExam = '';

  bool isDataUploading_uplodmemo = false;
  FFUploadedFile uploadedLocalFile_uplodmemo =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uplodmemo = '';

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    activityNameFocusNode?.dispose();
    activityNameTextController?.dispose();
  }
}
