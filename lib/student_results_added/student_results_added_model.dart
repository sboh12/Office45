import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enter_result_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flip_card/flip_card.dart';
import 'student_results_added_widget.dart' show StudentResultsAddedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentResultsAddedModel
    extends FlutterFlowModel<StudentResultsAddedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  UsersRecord? studentMark;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Summary widget.
  FocusNode? summaryFocusNode;
  TextEditingController? summaryTextController;
  String? Function(BuildContext, String?)? summaryTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? added;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AnswersRecord? addedRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    summaryFocusNode?.dispose();
    summaryTextController?.dispose();
  }
}
