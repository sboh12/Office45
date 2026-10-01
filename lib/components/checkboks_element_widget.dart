import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkboks_element_model.dart';
export 'checkboks_element_model.dart';

class CheckboksElementWidget extends StatefulWidget {
  const CheckboksElementWidget({super.key});

  @override
  State<CheckboksElementWidget> createState() => _CheckboksElementWidgetState();
}

class _CheckboksElementWidgetState extends State<CheckboksElementWidget> {
  late CheckboksElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboksElementModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
      ),
      child: Checkbox(
        value: _model.checkboxValue ??= true,
        onChanged: (newValue) async {
          safeSetState(() => _model.checkboxValue = newValue!);
        },
        side: (FlutterFlowTheme.of(context).secondaryText != null)
            ? BorderSide(
                width: 2,
                color: FlutterFlowTheme.of(context).secondaryText!,
              )
            : null,
        activeColor: FlutterFlowTheme.of(context).primary,
        checkColor: FlutterFlowTheme.of(context).info,
      ),
    );
  }
}
