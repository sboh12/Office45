import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mark_here_widget.dart' show MarkHereWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MarkHereModel extends FlutterFlowModel<MarkHereWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MarksHere widget.
  FocusNode? marksHereFocusNode;
  TextEditingController? marksHereTextController;
  String? Function(BuildContext, String?)? marksHereTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    marksHereFocusNode?.dispose();
    marksHereTextController?.dispose();
  }
}
