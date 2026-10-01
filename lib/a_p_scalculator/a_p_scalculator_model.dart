import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dashboard_result_widget.dart';
import '/components/mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'a_p_scalculator_widget.dart' show APScalculatorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class APScalculatorModel extends FlutterFlowModel<APScalculatorWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Mark dynamic component.
  late FlutterFlowDynamicModels<MarkModel> markModels;

  @override
  void initState(BuildContext context) {
    markModels = FlutterFlowDynamicModels(() => MarkModel());
  }

  @override
  void dispose() {
    markModels.dispose();
  }
}
