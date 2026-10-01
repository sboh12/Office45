import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'results_average_widget.dart' show ResultsAverageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsAverageModel extends FlutterFlowModel<ResultsAverageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for resultAve widget.
  FocusNode? resultAveFocusNode;
  TextEditingController? resultAveTextController;
  String? Function(BuildContext, String?)? resultAveTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    resultAveFocusNode?.dispose();
    resultAveTextController?.dispose();
  }
}
