import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_ai_model.dart';
export 'video_ai_model.dart';

class VideoAiWidget extends StatefulWidget {
  const VideoAiWidget({super.key});

  @override
  State<VideoAiWidget> createState() => _VideoAiWidgetState();
}

class _VideoAiWidgetState extends State<VideoAiWidget> {
  late VideoAiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoAiModel());
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: custom_widgets.VideoRecorder(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        onVideoSaved: '/storage/emulated/0/DCIM/my_video.mp4',
        maxVideoDuration: 30.0,
      ),
    );
  }
}
