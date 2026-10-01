import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'totals_model.dart';
export 'totals_model.dart';

class TotalsWidget extends StatefulWidget {
  const TotalsWidget({
    super.key,
    double? resultAverage,
    int? resultAps,
  })  : this.resultAverage = resultAverage ?? 0.0,
        this.resultAps = resultAps ?? 1;

  final double resultAverage;
  final int resultAps;

  @override
  State<TotalsWidget> createState() => _TotalsWidgetState();
}

class _TotalsWidgetState extends State<TotalsWidget> {
  late TotalsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalsModel());

    _model.totalMarksTextController ??= TextEditingController();
    _model.totalMarksFocusNode ??= FocusNode();

    _model.totalAverageTextController ??= TextEditingController();
    _model.totalAverageFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Color(0x0014181B),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.totalMarksTextController,
              focusNode: _model.totalMarksFocusNode,
              autofocus: false,
              readOnly: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: valueOrDefault<String>(
                  widget!.resultAverage.toString(),
                  '0',
                ),
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelMediumIsCustom,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelMediumIsCustom,
                    ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
              keyboardType: TextInputType.number,
              validator:
                  _model.totalMarksTextControllerValidator.asValidator(context),
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Color(0x0014181B),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.totalAverageTextController,
              focusNode: _model.totalAverageFocusNode,
              autofocus: false,
              readOnly: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: valueOrDefault<String>(
                  widget!.resultAps.toString(),
                  '0',
                ),
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelMediumIsCustom,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelMediumIsCustom,
                    ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).titleSmallIsCustom,
                  ),
              keyboardType: TextInputType.number,
              validator: _model.totalAverageTextControllerValidator
                  .asValidator(context),
            ),
          ),
        ),
      ],
    );
  }
}
