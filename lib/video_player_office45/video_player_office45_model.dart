import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment_box_widget.dart';
import '/components/edit_post_widget.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'video_player_office45_widget.dart' show VideoPlayerOffice45Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoPlayerOffice45Model
    extends FlutterFlowModel<VideoPlayerOffice45Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  int pageViewLoadedLength = 100;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  PagingController<DocumentSnapshot?, SchoolEventsRecord>?
      pageViewPagingController;
  Query? pageViewPagingQuery;

  // Model for Menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    pageViewPagingController?.dispose();

    menuModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, SchoolEventsRecord> setPageViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    pageViewPagingController ??= _createPageViewController(query, parent);
    if (pageViewPagingQuery != query) {
      pageViewPagingQuery = query;
      pageViewPagingController?.refresh();
    }
    return pageViewPagingController!;
  }

  PagingController<DocumentSnapshot?, SchoolEventsRecord>
      _createPageViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, SchoolEventsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => querySchoolEventsRecordPage(
          queryBuilder: (_) => pageViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 100,
          isStream: false,
        ),
      );
  }
}
