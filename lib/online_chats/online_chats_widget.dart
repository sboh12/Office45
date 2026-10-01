import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'online_chats_model.dart';
export 'online_chats_model.dart';

class OnlineChatsWidget extends StatefulWidget {
  const OnlineChatsWidget({super.key});

  static String routeName = 'OnlineChats';
  static String routePath = '/onlineChats';

  @override
  State<OnlineChatsWidget> createState() => _OnlineChatsWidgetState();
}

class _OnlineChatsWidgetState extends State<OnlineChatsWidget>
    with TickerProviderStateMixin {
  late OnlineChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnlineChatsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ChatsRecord>>(
      stream: queryChatsRecord(
        queryBuilder: (chatsRecord) => chatsRecord.where(
          'membersChatting',
          arrayContains: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: SpinKitPumpingHeart(
                  color: Color(0xC1295CFB),
                  size: 80.0,
                ),
              ),
            ),
          );
        }
        List<ChatsRecord> onlineChatsChatsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              elevation: 8.0,
              child: Icon(
                Icons.terminal_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'My Network',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).customColor1,
                    size: 34.0,
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF1F82E7),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 4.0, 0.0),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: AuthUserStreamWidget(
                        builder: (context) => Builder(
                          builder: (context) {
                            final registeredSubjectGroups = (currentUserDocument
                                        ?.subjectRegistered
                                        ?.toList() ??
                                    [])
                                .toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    registeredSubjectGroups.length,
                                    (registeredSubjectGroupsIndex) {
                                  final registeredSubjectGroupsItem =
                                      registeredSubjectGroups[
                                          registeredSubjectGroupsIndex];
                                  return StreamBuilder<SubjectsRecord>(
                                    stream: SubjectsRecord.getDocument(
                                        registeredSubjectGroupsItem),
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

                                      final containerSubjectsRecord =
                                          snapshot.data!;

                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Visibility(
                                          visible:
                                              containerSubjectsRecord != null,
                                          child: Stack(
                                            children: [
                                              Text(
                                                containerSubjectsRecord
                                                    .subjectName
                                                    .maybeHandleOverflow(
                                                  maxChars: 13,
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 12.0),
                                                  child: StreamBuilder<
                                                      SubjectsRecord>(
                                                    stream: SubjectsRecord
                                                        .getDocument(
                                                            registeredSubjectGroupsItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 80.0,
                                                            height: 80.0,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: Color(
                                                                  0xC1295CFB),
                                                              size: 80.0,
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final circleImageSubjectsRecord =
                                                          snapshot.data!;

                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.countGroup =
                                                              await queryGroupChatsRecordCount(
                                                            queryBuilder:
                                                                (groupChatsRecord) =>
                                                                    groupChatsRecord
                                                                        .where(
                                                              'SubjectGroup',
                                                              isEqualTo:
                                                                  registeredSubjectGroupsItem,
                                                            ),
                                                          );
                                                          if (_model
                                                                  .countGroup ==
                                                              1) {
                                                            _model.grouChatDoc =
                                                                await queryGroupChatsRecordOnce(
                                                              queryBuilder:
                                                                  (groupChatsRecord) =>
                                                                      groupChatsRecord
                                                                          .where(
                                                                'SubjectGroup',
                                                                isEqualTo:
                                                                    registeredSubjectGroupsItem,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);

                                                            context.pushNamed(
                                                              GroupChatsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'userRef':
                                                                    serializeParam(
                                                                  currentUserReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'userProfile':
                                                                    serializeParam(
                                                                  currentUserPhoto,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'chatUser':
                                                                    serializeParam(
                                                                  _model
                                                                      .grouChatDoc
                                                                      ?.reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'groupName':
                                                                    serializeParam(
                                                                  circleImageSubjectsRecord
                                                                      .subjectName,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'groupImage':
                                                                    serializeParam(
                                                                  circleImageSubjectsRecord
                                                                      .subjectImage,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'subjectInfo':
                                                                    serializeParam(
                                                                  circleImageSubjectsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            await GroupChatsRecord
                                                                .collection
                                                                .doc()
                                                                .set({
                                                              ...createGroupChatsRecordData(
                                                                user:
                                                                    currentUserReference,
                                                                userA:
                                                                    currentUserReference,
                                                                lastSeen:
                                                                    getCurrentTimestamp,
                                                                lastMessage:
                                                                    circleImageSubjectsRecord
                                                                        .level,
                                                                image: circleImageSubjectsRecord
                                                                    .subjectImage,
                                                                messageSeen:
                                                                    false,
                                                                subjectGroup:
                                                                    circleImageSubjectsRecord
                                                                        .reference,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'GroupMembers':
                                                                      [
                                                                    circleImageSubjectsRecord
                                                                        .reference
                                                                        .id
                                                                  ],
                                                                },
                                                              ),
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Subject Added Successfully',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              circleImageSubjectsRecord
                                                                  .subjectImage,
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Noun_Project_cloud_upload_icon_411593_cc.svg/1130px-Noun_Project_cloud_upload_icon_411593_cc.svg.png',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.93, -1.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.solidCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor: Color(0xFF1F82E7),
                            padding: EdgeInsets.all(4.0),
                            tabs: [
                              Tab(
                                text: 'Groups',
                                icon: Icon(
                                  Icons.groups,
                                  color: Color(0xFF1F82E7),
                                ),
                              ),
                              Tab(
                                text: 'Contacts',
                                icon: Icon(
                                  Icons.person,
                                  color: Color(0xFF1F82E7),
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final subjects = (currentUserDocument
                                                ?.subjectRegistered
                                                ?.toList() ??
                                            [])
                                        .toList();

                                    return ReorderableListView.builder(
                                      padding: EdgeInsets.zero,
                                      proxyDecorator: (Widget child, int index,
                                              Animation<double> animation) =>
                                          Material(
                                              color: Colors.transparent,
                                              child: child),
                                      scrollDirection: Axis.vertical,
                                      itemCount: subjects.length,
                                      itemBuilder: (context, subjectsIndex) {
                                        final subjectsItem =
                                            subjects[subjectsIndex];
                                        return Container(
                                          key: ValueKey("ListView_g5u131bh" +
                                              '_' +
                                              subjectsIndex.toString()),
                                          child: StreamBuilder<
                                              List<GroupChatsRecord>>(
                                            stream: queryGroupChatsRecord(
                                              queryBuilder:
                                                  (groupChatsRecord) =>
                                                      groupChatsRecord.where(
                                                'SubjectGroup',
                                                isEqualTo: subjectsItem,
                                              ),
                                              singleRecord: true,
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
                                              List<GroupChatsRecord>
                                                  rowGroupChatsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final rowGroupChatsRecord =
                                                  rowGroupChatsRecordList
                                                          .isNotEmpty
                                                      ? rowGroupChatsRecordList
                                                          .first
                                                      : null;

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (rowGroupChatsRecord !=
                                                      null)
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          GroupChatsWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'userRef':
                                                                serializeParam(
                                                              currentUserReference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'userProfile':
                                                                serializeParam(
                                                              currentUserPhoto,
                                                              ParamType.String,
                                                            ),
                                                            'chatUser':
                                                                serializeParam(
                                                              rowGroupChatsRecord
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'groupName':
                                                                serializeParam(
                                                              'No GroupName',
                                                              ParamType.String,
                                                            ),
                                                            'groupImage':
                                                                serializeParam(
                                                              rowGroupChatsRecord
                                                                  ?.image,
                                                              ParamType.String,
                                                            ),
                                                            'subjectInfo':
                                                                serializeParam(
                                                              subjectsItem,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: StreamBuilder<
                                                            SubjectsRecord>(
                                                          stream: SubjectsRecord
                                                              .getDocument(
                                                                  subjectsItem),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 80.0,
                                                                  height: 80.0,
                                                                  child:
                                                                      SpinKitPumpingHeart(
                                                                    color: Color(
                                                                        0xC1295CFB),
                                                                    size: 80.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final rowSubjectsRecord =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.37,
                                                                          0.34),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            0.0,
                                                                            12.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            rowGroupChatsRecord!.image,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (rowGroupChatsRecord
                                                                            ?.userA !=
                                                                        currentUserReference)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              badges.Badge(
                                                                            badgeContent:
                                                                                Text(
                                                                              '1+',
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                            showBadge:
                                                                                true,
                                                                            shape:
                                                                                badges.BadgeShape.circle,
                                                                            badgeColor:
                                                                                Color(0xC1078129),
                                                                            elevation:
                                                                                4.0,
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            position:
                                                                                badges.BadgePosition.topEnd(),
                                                                            animationType:
                                                                                badges.BadgeAnimationType.scale,
                                                                            toAnimate:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                Flexible(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              rowSubjectsRecord.subjectName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                rowGroupChatsRecord!.lastMessage.maybeHandleOverflow(
                                                                                  maxChars: 12,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                dateTimeFormat(
                                                                                  "yQQQ",
                                                                                  rowSubjectsRecord.createdAt!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ).maybeHandleOverflow(
                                                                                  maxChars: 12,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          "relative",
                                                                          rowGroupChatsRecord!
                                                                              .lastSeen!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      if (!rowGroupChatsRecord!
                                                                          .messageSeen)
                                                                        Icon(
                                                                          Icons
                                                                              .done_all_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      if (rowGroupChatsRecord
                                                                              ?.messageSeen ??
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .done_all_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor1,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      onReorder: (int reorderableOldIndex,
                                          int reorderableNewIndex) async {},
                                    );
                                  },
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          UsersRecord>(
                                        pagingController:
                                            _model.setListViewController3(
                                          UsersRecord.collection.where(
                                            'schoolRegistered',
                                            isEqualTo: currentUserDocument
                                                ?.schoolRegistered,
                                            isNull: (currentUserDocument
                                                    ?.schoolRegistered) ==
                                                null,
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                UsersRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 80.0,
                                              height: 80.0,
                                              child: SpinKitPumpingHeart(
                                                color: Color(0xC1295CFB),
                                                size: 80.0,
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 80.0,
                                              height: 80.0,
                                              child: SpinKitPumpingHeart(
                                                color: Color(0xC1295CFB),
                                                size: 80.0,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewUsersRecord = _model
                                                .listViewPagingController3!
                                                .itemList![listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        NewprofileUserWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'user':
                                                              serializeParam(
                                                            listViewUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Container(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                listViewUsersRecord
                                                                    .photoUrl,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.93, -1.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .solidCircle,
                                                            color: listViewUsersRecord
                                                                    .online
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            listViewUsersRecord
                                                                .fullName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              listViewUsersRecord
                                                                  .level
                                                                  .maybeHandleOverflow(
                                                                maxChars: 12,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (onlineChatsChatsRecordList
                                                                  .where((e) => e
                                                                      .membersChatting
                                                                      .contains(
                                                                          listViewUsersRecord
                                                                              .reference))
                                                                  .toList()
                                                                  .length <=
                                                              0)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FFFFFF),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().members =
                                                                              [];
                                                                          FFAppState()
                                                                              .addToMembers(currentUserReference!);
                                                                          FFAppState()
                                                                              .addToMembers(listViewUsersRecord.reference);
                                                                          FFAppState()
                                                                              .addToMembers(currentUserReference!);

                                                                          await ChatsRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set({
                                                                            ...createChatsRecordData(
                                                                              user: currentUserReference,
                                                                              userA: currentUserReference,
                                                                              lastMessage: 'Hello',
                                                                              image: currentUserPhoto,
                                                                              userB: listViewUsersRecord.reference,
                                                                              lastMessageTime: getCurrentTimestamp,
                                                                              messageSeen: true,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'membersChatting': FFAppState().members,
                                                                              },
                                                                            ),
                                                                          });
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .mark_chat_read_rounded,
                                                                          color:
                                                                              Color(0xFF10E73F),
                                                                          size:
                                                                              44.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (onlineChatsChatsRecordList
                                                                  .where((e) => e
                                                                      .membersChatting
                                                                      .contains(
                                                                          listViewUsersRecord
                                                                              .reference))
                                                                  .toList()
                                                                  .length >
                                                              0)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FFFFFF),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.countGroup1 =
                                                                              await queryChatsRecordOnce(
                                                                            queryBuilder: (chatsRecord) =>
                                                                                chatsRecord.where(
                                                                              'membersChatting',
                                                                              arrayContains: listViewUsersRecord.reference,
                                                                            ),
                                                                          );
                                                                          FFAppState().members =
                                                                              [];
                                                                          FFAppState()
                                                                              .addToMembers(listViewUsersRecord.reference);
                                                                          FFAppState()
                                                                              .addToMembers(currentUserReference!);
                                                                          if (_model.countGroup1!.where((e) => e.membersChatting.contains(currentUserReference)).toList().length >
                                                                              0) {
                                                                            context.pushNamed(
                                                                              SingleChatsWidget.routeName,
                                                                              queryParameters: {
                                                                                'userProfile': serializeParam(
                                                                                  currentUserPhoto,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'userRef': serializeParam(
                                                                                  currentUserReference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'chatUser': serializeParam(
                                                                                  _model.countGroup1?.where((e) => e.membersChatting.contains(currentUserReference)).toList()?.firstOrNull?.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'groupName': serializeParam(
                                                                                  currentUserDisplayName,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'groupImage': serializeParam(
                                                                                  listViewUsersRecord.photoUrl,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'userb': serializeParam(
                                                                                  listViewUsersRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Error occured',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).error,
                                                                              ),
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .message,
                                                                          color:
                                                                              Color(0xFF10E73F),
                                                                          size:
                                                                              44.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
