import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/namebroadcst_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'broadcastlisting_widget.dart' show BroadcastlistingWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BroadcastlistingModel extends FlutterFlowModel<BroadcastlistingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getLiveStreamId)] action in Row widget.
  ApiCallResponse? liveStreamIdResult;
  // Stores action output result for [Backend Call - API (getPastLiveStream)] action in Row widget.
  ApiCallResponse? pastLiveStreamResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
