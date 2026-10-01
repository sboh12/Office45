import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'viewbroadcast_model.dart';
export 'viewbroadcast_model.dart';

class ViewbroadcastWidget extends StatefulWidget {
  const ViewbroadcastWidget({
    super.key,
    required this.url,
  });

  final String? url;

  static String routeName = 'viewbroadcast';
  static String routePath = '/viewbroadcast';

  @override
  State<ViewbroadcastWidget> createState() => _ViewbroadcastWidgetState();
}

class _ViewbroadcastWidgetState extends State<ViewbroadcastWidget> {
  late ViewbroadcastModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewbroadcastModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent2,
          automaticallyImplyLeading: false,
          title: Text(
            'view broadcast',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.robotoCondensed(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowVideoPlayer(
                path: widget!.url!,
                videoType: VideoType.network,
                autoPlay: false,
                looping: true,
                showControls: true,
                allowFullScreen: true,
                allowPlaybackSpeedMenu: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
