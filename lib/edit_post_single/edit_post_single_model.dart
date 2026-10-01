import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import 'edit_post_single_widget.dart' show EditPostSingleWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditPostSingleModel extends FlutterFlowModel<EditPostSingleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Heading widget.
  FocusNode? headingFocusNode;
  TextEditingController? headingTextController;
  String? Function(BuildContext, String?)? headingTextControllerValidator;
  bool isDataUploading_uploadNewImage = false;
  FFUploadedFile uploadedLocalFile_uploadNewImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadNewImage = '';

  // State field(s) for Content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  // State field(s) for Date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headingFocusNode?.dispose();
    headingTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();
  }
}
