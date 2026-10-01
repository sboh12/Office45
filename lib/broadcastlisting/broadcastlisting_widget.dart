import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/namebroadcst_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'broadcastlisting_model.dart';
export 'broadcastlisting_model.dart';

class BroadcastlistingWidget extends StatefulWidget {
  const BroadcastlistingWidget({super.key});

  static String routeName = 'broadcastlisting';
  static String routePath = '/broadcastlisting';

  @override
  State<BroadcastlistingWidget> createState() => _BroadcastlistingWidgetState();
}

class _BroadcastlistingWidgetState extends State<BroadcastlistingWidget> {
  late BroadcastlistingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BroadcastlistingModel());
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return WebViewAware(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: NamebroadcstWidget(),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          elevation: 8.0,
          child: FaIcon(
            FontAwesomeIcons.video,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent2,
          automaticallyImplyLeading: false,
          title: Text(
            'Meetings',
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
          child: StreamBuilder<List<BroadcastRecord>>(
            stream: queryBroadcastRecord(
              queryBuilder: (broadcastRecord) =>
                  broadcastRecord.orderBy('time', descending: true),
              limit: 5,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: SpinKitPumpingHeart(
                      color: Color(0xC1295CFB),
                      size: 80.0,
                    ),
                  ),
                );
              }
              List<BroadcastRecord> listViewBroadcastRecordList =
                  snapshot.data!;

              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewBroadcastRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewBroadcastRecord =
                      listViewBroadcastRecordList[listViewIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (listViewBroadcastRecord.islive) {
                        context.pushNamed(
                          ViewbroadcastWidget.routeName,
                          queryParameters: {
                            'url': serializeParam(
                              listViewBroadcastRecord.url,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        _model.liveStreamIdResult =
                            await GetLiveStreamIdCall.call(
                          playbackId: functions.getPlaybackIdFromUrl(
                              listViewBroadcastRecord.url),
                        );

                        _model.pastLiveStreamResult =
                            await GetPastLiveStreamCall.call(
                          streamId: GetLiveStreamIdCall.streamid(
                            (_model.liveStreamIdResult?.jsonBody ?? ''),
                          ).toString(),
                        );

                        context.pushNamed(
                          ViewbroadcastWidget.routeName,
                          queryParameters: {
                            'url': serializeParam(
                              functions.createUrlFromPlaybackId(
                                  GetPastLiveStreamCall.playbackid(
                                (_model.pastLiveStreamResult?.jsonBody ?? ''),
                              ).toString()),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      }

                      safeSetState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            listViewBroadcastRecord.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        if (listViewBroadcastRecord.islive)
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: FaIcon(
                              FontAwesomeIcons.broadcastTower,
                              color: FlutterFlowTheme.of(context).tertiary400,
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                      ]
                          .divide(SizedBox(width: 5.0))
                          .around(SizedBox(width: 5.0)),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
