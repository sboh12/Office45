import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/components/select_language_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'ai_options_widget.dart' show AiOptionsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AiOptionsModel extends FlutterFlowModel<AiOptionsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Gemini - Generate Text] action in Column widget.
  String? paraphrase;
  // Stores action output result for [Gemini - Generate Text] action in Column widget.
  String? summarise;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
