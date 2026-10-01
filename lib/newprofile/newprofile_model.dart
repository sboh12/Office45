import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'newprofile_widget.dart' show NewprofileWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewprofileModel extends FlutterFlowModel<NewprofileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_newPhoto = false;
  FFUploadedFile uploadedLocalFile_newPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_newPhoto = '';

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SubjectsRecord>? subjects;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<NotesRecord>? totalNotes;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ActivityRecord>? totalActivity;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? subjectsStats;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalNotesStats;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalActivityStats;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? documentms;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? messages;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? announcementd;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? userss;
  // Model for Menu component.
  late MenuModel menuModel;
  // State field(s) for Checkbox widget.
  Map<DocumentReference, bool> checkboxValueMap1 = {};
  List<DocumentReference> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<DocumentReference, bool> checkboxValueMap2 = {};
  List<DocumentReference> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<DocumentReference, bool> checkboxValueMap3 = {};
  List<DocumentReference> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
  }
}
