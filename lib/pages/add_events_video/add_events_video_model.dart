import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'add_events_video_widget.dart' show AddEventsVideoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEventsVideoModel extends FlutterFlowModel<AddEventsVideoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_videoFile = false;
  FFUploadedFile uploadedLocalFile_videoFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for Datesa widget.
  FocusNode? datesaFocusNode;
  TextEditingController? datesaTextController;
  String? Function(BuildContext, String?)? datesaTextControllerValidator;
  // State field(s) for EventContent widget.
  FocusNode? eventContentFocusNode;
  TextEditingController? eventContentTextController;
  String? Function(BuildContext, String?)? eventContentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    datesaFocusNode?.dispose();
    datesaTextController?.dispose();

    eventContentFocusNode?.dispose();
    eventContentTextController?.dispose();
  }
}
