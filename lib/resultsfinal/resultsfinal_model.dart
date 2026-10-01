import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/exam_level_widget.dart';
import '/components/exam_mark_widget.dart';
import '/components/mark_here_widget.dart';
import '/components/results_average_widget.dart';
import '/components/totals_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flip_card/flip_card.dart';
import 'resultsfinal_widget.dart' show ResultsfinalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsfinalModel extends FlutterFlowModel<ResultsfinalWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for SearchByyear widget.
  FocusNode? searchByyearFocusNode;
  TextEditingController? searchByyearTextController;
  String? Function(BuildContext, String?)? searchByyearTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for ExamMark dynamic component.
  late FlutterFlowDynamicModels<ExamMarkModel> examMarkModels;
  // Models for ExamLevel dynamic component.
  late FlutterFlowDynamicModels<ExamLevelModel> examLevelModels;
  // Models for MarkHere dynamic component.
  late FlutterFlowDynamicModels<MarkHereModel> markHereModels;
  // Models for resultsAverage dynamic component.
  late FlutterFlowDynamicModels<ResultsAverageModel> resultsAverageModels;

  @override
  void initState(BuildContext context) {
    examMarkModels = FlutterFlowDynamicModels(() => ExamMarkModel());
    examLevelModels = FlutterFlowDynamicModels(() => ExamLevelModel());
    markHereModels = FlutterFlowDynamicModels(() => MarkHereModel());
    resultsAverageModels =
        FlutterFlowDynamicModels(() => ResultsAverageModel());
  }

  @override
  void dispose() {
    searchByyearFocusNode?.dispose();
    searchByyearTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    examMarkModels.dispose();
    examLevelModels.dispose();
    markHereModels.dispose();
    resultsAverageModels.dispose();
  }
}
