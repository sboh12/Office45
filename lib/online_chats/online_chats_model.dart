import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnlineChatsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // Stores action output result for [Firestore Query - Query a collection] action in CircleImage widget.
  int? countGroup;
  // Stores action output result for [Firestore Query - Query a collection] action in CircleImage widget.
  GroupChatsRecord? grouChatDoc;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController1 = ScrollController();
    rowController = ScrollController();
    listViewController2 = ScrollController();
    listViewController3 = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    listViewController1?.dispose();
    textController?.dispose();
    rowController?.dispose();
    listViewController2?.dispose();
    listViewController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
