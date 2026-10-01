import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'results_average_model.dart';
export 'results_average_model.dart';

class ResultsAverageWidget extends StatefulWidget {
  const ResultsAverageWidget({
    super.key,
    int? averageSymbol,
  }) : this.averageSymbol = averageSymbol ?? 7;

  final int averageSymbol;

  @override
  State<ResultsAverageWidget> createState() => _ResultsAverageWidgetState();
}

class _ResultsAverageWidgetState extends State<ResultsAverageWidget> {
  late ResultsAverageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultsAverageModel());

    _model.resultAveTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      () {
        if ((widget!.averageSymbol >= 30) && (widget!.averageSymbol < 40)) {
          return 2;
        } else if ((widget!.averageSymbol >= 40) &&
            (widget!.averageSymbol < 50)) {
          return 3;
        } else if ((widget!.averageSymbol >= 50) &&
            (widget!.averageSymbol < 60)) {
          return 4;
        } else if ((widget!.averageSymbol >= 60) &&
            (widget!.averageSymbol < 70)) {
          return 5;
        } else if ((widget!.averageSymbol >= 70) &&
            (widget!.averageSymbol < 80)) {
          return 6;
        } else if (widget!.averageSymbol >= 80) {
          return 7;
        } else {
          return 1;
        }
      }()
          .toString(),
      '1',
    ));
    _model.resultAveFocusNode ??= FocusNode();
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
        controller: _model.resultAveTextController,
        focusNode: _model.resultAveFocusNode,
        autofocus: false,
        readOnly: true,
        obscureText: false,
        decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                color: FlutterFlowTheme.of(context).tertiary,
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
              color: FlutterFlowTheme.of(context).tertiary,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: _model.resultAveTextControllerValidator.asValidator(context),
      ),
    );
  }
}
