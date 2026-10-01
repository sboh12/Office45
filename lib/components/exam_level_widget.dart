import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exam_level_model.dart';
export 'exam_level_model.dart';

class ExamLevelWidget extends StatefulWidget {
  const ExamLevelWidget({
    super.key,
    int? examMark,
  }) : this.examMark = examMark ?? 0;

  final int examMark;

  @override
  State<ExamLevelWidget> createState() => _ExamLevelWidgetState();
}

class _ExamLevelWidgetState extends State<ExamLevelWidget> {
  late ExamLevelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExamLevelModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      () {
        if ((widget!.examMark >= 30) && (widget!.examMark < 40)) {
          return 2;
        } else if ((widget!.examMark >= 40) && (widget!.examMark < 50)) {
          return 3;
        } else if ((widget!.examMark >= 50) && (widget!.examMark < 60)) {
          return 4;
        } else if ((widget!.examMark >= 60) && (widget!.examMark < 70)) {
          return 5;
        } else if ((widget!.examMark >= 70) && (widget!.examMark < 80)) {
          return 6;
        } else if (widget!.examMark >= 80) {
          return 7;
        } else {
          return 1;
        }
      }()
          .toString(),
      '1',
    ));
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).labelMediumIsCustom,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).labelMediumIsCustom,
              ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).primaryBackground,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
