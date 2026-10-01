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
import 'pass_rate_form_widget.dart' show PassRateFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassRateFormModel extends FlutterFlowModel<PassRateFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;
  // State field(s) for term widget.
  String? termValue;
  FormFieldController<String>? termValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in term widget.
  PassRateRecord? passRateTerm;
  // State field(s) for Grade8 widget.
  FocusNode? grade8FocusNode;
  TextEditingController? grade8TextController;
  String? Function(BuildContext, String?)? grade8TextControllerValidator;
  // State field(s) for Grade9 widget.
  FocusNode? grade9FocusNode;
  TextEditingController? grade9TextController;
  String? Function(BuildContext, String?)? grade9TextControllerValidator;
  // State field(s) for Grade10 widget.
  FocusNode? grade10FocusNode;
  TextEditingController? grade10TextController;
  String? Function(BuildContext, String?)? grade10TextControllerValidator;
  // State field(s) for Grade11 widget.
  FocusNode? grade11FocusNode;
  TextEditingController? grade11TextController;
  String? Function(BuildContext, String?)? grade11TextControllerValidator;
  // State field(s) for Grade12 widget.
  FocusNode? grade12FocusNode;
  TextEditingController? grade12TextController;
  String? Function(BuildContext, String?)? grade12TextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PassRateRecord? pass;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    grade8FocusNode?.dispose();
    grade8TextController?.dispose();

    grade9FocusNode?.dispose();
    grade9TextController?.dispose();

    grade10FocusNode?.dispose();
    grade10TextController?.dispose();

    grade11FocusNode?.dispose();
    grade11TextController?.dispose();

    grade12FocusNode?.dispose();
    grade12TextController?.dispose();
  }
}
