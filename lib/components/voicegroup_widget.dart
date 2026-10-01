import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'voicegroup_model.dart';
export 'voicegroup_model.dart';

class VoicegroupWidget extends StatefulWidget {
  const VoicegroupWidget({
    super.key,
    required this.groupId,
    required this.usersId,
  });

  final String? groupId;
  final List<String>? usersId;

  @override
  State<VoicegroupWidget> createState() => _VoicegroupWidgetState();
}

class _VoicegroupWidgetState extends State<VoicegroupWidget> {
  late VoicegroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoicegroupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: custom_widgets.GroupVoiceCall(
          width: double.infinity,
          height: double.infinity,
          groupId: widget!.groupId!,
          userIds: widget!.usersId!,
        ),
      ),
    );
  }
}
