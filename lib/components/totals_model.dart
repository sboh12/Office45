import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'totals_widget.dart' show TotalsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TotalsModel extends FlutterFlowModel<TotalsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for totalMarks widget.
  FocusNode? totalMarksFocusNode;
  TextEditingController? totalMarksTextController;
  String? Function(BuildContext, String?)? totalMarksTextControllerValidator;
  // State field(s) for totalAverage widget.
  FocusNode? totalAverageFocusNode;
  TextEditingController? totalAverageTextController;
  String? Function(BuildContext, String?)? totalAverageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    totalMarksFocusNode?.dispose();
    totalMarksTextController?.dispose();

    totalAverageFocusNode?.dispose();
    totalAverageTextController?.dispose();
  }
}
