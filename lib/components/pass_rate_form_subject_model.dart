import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pass_rate_form_subject_widget.dart' show PassRateFormSubjectWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassRateFormSubjectModel
    extends FlutterFlowModel<PassRateFormSubjectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for term widget.
  String? termValue1;
  FormFieldController<String>? termValueController1;
  // State field(s) for perccent widget.
  FocusNode? perccentFocusNode;
  TextEditingController? perccentTextController;
  String? Function(BuildContext, String?)? perccentTextControllerValidator;
  // State field(s) for absent widget.
  FocusNode? absentFocusNode;
  TextEditingController? absentTextController;
  String? Function(BuildContext, String?)? absentTextControllerValidator;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // State field(s) for term widget.
  List<String>? termValue2;
  FormFieldController<List<String>>? termValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    perccentFocusNode?.dispose();
    perccentTextController?.dispose();

    absentFocusNode?.dispose();
    absentTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
