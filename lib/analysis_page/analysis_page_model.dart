import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/list_teacher_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'analysis_page_widget.dart' show AnalysisPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AnalysisPageModel extends FlutterFlowModel<AnalysisPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AnalysisPage widget.
  List<SchoolRecord>? schools;
  // Stores action output result for [Firestore Query - Query a collection] action in AnalysisPage widget.
  List<SubjectsRecord>? subjects;
  // Stores action output result for [Firestore Query - Query a collection] action in AnalysisPage widget.
  int? totalNotes;
  // Stores action output result for [Firestore Query - Query a collection] action in AnalysisPage widget.
  int? totalActivity;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
