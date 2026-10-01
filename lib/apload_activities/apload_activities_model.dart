import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'apload_activities_widget.dart' show AploadActivitiesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AploadActivitiesModel extends FlutterFlowModel<AploadActivitiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for activityName widget.
  FocusNode? activityNameFocusNode;
  TextEditingController? activityNameTextController;
  String? Function(BuildContext, String?)? activityNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_uploadAssignment = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadAssignment = [];
  List<String> uploadedFileUrls_uploadAssignment = [];

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    activityNameFocusNode?.dispose();
    activityNameTextController?.dispose();
  }
}
