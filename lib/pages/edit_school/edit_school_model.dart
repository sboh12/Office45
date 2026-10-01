import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:ui';
import '/index.dart';
import 'edit_school_widget.dart' show EditSchoolWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditSchoolModel extends FlutterFlowModel<EditSchoolWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataSchoolLogo = false;
  FFUploadedFile uploadedLocalFile_uploadDataSchoolLogo =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataSchoolLogo = '';

  bool isDataUploading_uploadDataCode = false;
  FFUploadedFile uploadedLocalFile_uploadDataCode =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataCode = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
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
    nameFocusNode?.dispose();
    nameTextController?.dispose();

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
