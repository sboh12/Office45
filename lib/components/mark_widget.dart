import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mark_model.dart';
export 'mark_model.dart';

class MarkWidget extends StatefulWidget {
  const MarkWidget({super.key});

  @override
  State<MarkWidget> createState() => _MarkWidgetState();
}

class _MarkWidgetState extends State<MarkWidget> {
  late MarkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarkModel());

    _model.subjectTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      () {
        if ((functions.stringToInt(valueOrDefault<String>(
                  _model.textController2.text,
                  '0',
                ))! >=
                30) &&
            (functions.stringToInt(valueOrDefault<String>(
                  _model.textController2.text,
                  '0',
                ))! <
                40)) {
          return 2;
        } else if ((functions.stringToInt(_model.textController2.text)! >=
                40) &&
            (functions.stringToInt(_model.textController2.text)! < 50)) {
          return 3;
        } else if ((functions.stringToInt(_model.textController2.text)! >=
                50) &&
            (functions.stringToInt(_model.textController2.text)! < 60)) {
          return 4;
        } else if ((functions.stringToInt(_model.textController2.text)! >=
                60) &&
            (functions.stringToInt(_model.textController2.text)! < 70)) {
          return 5;
        } else if ((functions.stringToInt(_model.textController2.text)! >=
                70) &&
            (functions.stringToInt(_model.textController2.text)! < 80)) {
          return 6;
        } else if (functions.stringToInt(_model.textController2.text)! >= 80) {
          return 7;
        } else {
          return 1;
        }
      }()
          .toString(),
      '1',
    ));
    _model.subjectFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController2?.text = '0';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (_model.textController2.text != null &&
            _model.textController2.text != '')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.subjectTextController,
              focusNode: _model.subjectFocusNode,
              autofocus: true,
              readOnly: true,
              obscureText: false,
              decoration: InputDecoration(
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
                      fontSize: 9.0,
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
                    fontSize: 9.0,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
              keyboardType: TextInputType.number,
              validator:
                  _model.subjectTextControllerValidator.asValidator(context),
            ),
          ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textController2,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController2',
                Duration(milliseconds: 2000),
                () async {
                  safeSetState(() {
                    _model.subjectTextController?.text = valueOrDefault<String>(
                      () {
                        if ((functions.stringToInt(valueOrDefault<String>(
                                  _model.textController2.text,
                                  '0',
                                ))! >=
                                30) &&
                            (functions.stringToInt(valueOrDefault<String>(
                                  _model.textController2.text,
                                  '0',
                                ))! <
                                40)) {
                          return 2;
                        } else if ((functions.stringToInt(
                                    _model.textController2.text)! >=
                                40) &&
                            (functions.stringToInt(_model.textController2.text)! <
                                50)) {
                          return 3;
                        } else if ((functions.stringToInt(
                                    _model.textController2.text)! >=
                                50) &&
                            (functions.stringToInt(_model.textController2.text)! <
                                60)) {
                          return 4;
                        } else if ((functions.stringToInt(
                                    _model.textController2.text)! >=
                                60) &&
                            (functions.stringToInt(_model.textController2.text)! <
                                70)) {
                          return 5;
                        } else if ((functions.stringToInt(
                                    _model.textController2.text)! >=
                                70) &&
                            (functions.stringToInt(_model.textController2.text)! <
                                80)) {
                          return 6;
                        } else if (functions
                                .stringToInt(_model.textController2.text)! >=
                            80) {
                          return 7;
                        } else {
                          return 1;
                        }
                      }()
                          .toString(),
                      '1',
                    );
                  });
                },
              ),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
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
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _model.textController2Validator.asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
