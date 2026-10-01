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
import 'dart:ui';
import '/index.dart';
import 'add_school_widget.dart' show AddSchoolWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSchoolModel extends FlutterFlowModel<AddSchoolWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataPia = false;
  FFUploadedFile uploadedLocalFile_uploadDataPia =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPia = '';

  bool isDataUploading_uploadDataKch = false;
  FFUploadedFile uploadedLocalFile_uploadDataKch =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataKch = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
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
  FocusNode? bioFocusNode;
  TextEditingController? bioTextController;
  String? Function(BuildContext, String?)? bioTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Email widget.
  int? emailExist;
  // State field(s) for Tel widget.
  FocusNode? telFocusNode;
  TextEditingController? telTextController;
  String? Function(BuildContext, String?)? telTextControllerValidator;
  // State field(s) for Maximum widget.
  FocusNode? maximumFocusNode;
  TextEditingController? maximumTextController;
  String? Function(BuildContext, String?)? maximumTextControllerValidator;
  // State field(s) for Enroll widget.
  FocusNode? enrollFocusNode;
  TextEditingController? enrollTextController;
  String? Function(BuildContext, String?)? enrollTextControllerValidator;
  // State field(s) for Performance widget.
  FocusNode? performanceFocusNode;
  TextEditingController? performanceTextController;
  String? Function(BuildContext, String?)? performanceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();

    bioFocusNode?.dispose();
    bioTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    telFocusNode?.dispose();
    telTextController?.dispose();

    maximumFocusNode?.dispose();
    maximumTextController?.dispose();

    enrollFocusNode?.dispose();
    enrollTextController?.dispose();

    performanceFocusNode?.dispose();
    performanceTextController?.dispose();
  }
}
