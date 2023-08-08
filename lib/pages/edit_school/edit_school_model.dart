import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditSchoolModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for name widget.
  TextEditingController? nameController1;
  String? Function(BuildContext, String?)? nameController1Validator;
  // State field(s) for name widget.
  TextEditingController? nameController2;
  String? Function(BuildContext, String?)? nameController2Validator;
  // State field(s) for Quantile widget.
  String? quantileValue;
  FormFieldController<String>? quantileValueController;
  // State field(s) for SchoolType widget.
  String? schoolTypeValue;
  FormFieldController<String>? schoolTypeValueController;
  // State field(s) for Province widget.
  String? provinceValue;
  FormFieldController<String>? provinceValueController;
  // State field(s) for bio widget.
  TextEditingController? bioController;
  String? Function(BuildContext, String?)? bioControllerValidator;
  // State field(s) for address widget.
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for City widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Email widget.
  int? emailExist;
  // State field(s) for Tel widget.
  TextEditingController? telController;
  String? Function(BuildContext, String?)? telControllerValidator;
  // State field(s) for Maximum widget.
  TextEditingController? maximumController;
  String? Function(BuildContext, String?)? maximumControllerValidator;
  // State field(s) for Enroll widget.
  TextEditingController? enrollController;
  String? Function(BuildContext, String?)? enrollControllerValidator;
  // State field(s) for Performance widget.
  TextEditingController? performanceController;
  String? Function(BuildContext, String?)? performanceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController1?.dispose();
    nameController2?.dispose();
    bioController?.dispose();
    addressController?.dispose();
    cityController?.dispose();
    emailController?.dispose();
    telController?.dispose();
    maximumController?.dispose();
    enrollController?.dispose();
    performanceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
