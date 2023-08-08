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
import 'online_chats_model.dart';
export 'online_chats_model.dart';

class OnlineChatsWidget extends StatefulWidget {
  const OnlineChatsWidget({Key? key}) : super(key: key);

  @override
  _OnlineChatsWidgetState createState() => _OnlineChatsWidgetState();
}

class _OnlineChatsWidgetState extends State<OnlineChatsWidget> {
  late OnlineChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnlineChatsModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F82E7),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      await _model.listViewController3
                                          ?.animateTo(
                                        0,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    },
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
                                    focusedErrorBorder: UnderlineInputBorder(
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
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                controller: _model.listViewController1,
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final registeredSubjectGroups =
                          (currentUserDocument?.subjectRegistered?.toList() ??
                                  [])
                              .toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _model.rowController,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(registeredSubjectGroups.length,
                                  (registeredSubjectGroupsIndex) {
                            final registeredSubjectGroupsItem =
                                registeredSubjectGroups[
                                    registeredSubjectGroupsIndex];
                            return Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 12.0),
                                      child: StreamBuilder<SubjectsRecord>(
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
                                          final circleImageSubjectsRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.countGroup =
                                                  await queryGroupChatsRecordCount(
                                                queryBuilder: (groupChatsRecord) =>
                                                    groupChatsRecord.where(
                                                        'SubjectGroup',
                                                        isEqualTo:
                                                            registeredSubjectGroupsItem),
                                              );
                                              if (_model.countGroup == 1) {
                                                _model.grouChatDoc =
                                                    await queryGroupChatsRecordOnce(
                                                  queryBuilder: (groupChatsRecord) =>
                                                      groupChatsRecord.where(
                                                          'SubjectGroup',
                                                          isEqualTo:
                                                              registeredSubjectGroupsItem),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);

                                                context.pushNamed(
                                                  'GroupChats',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      currentUserReference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'userProfile':
                                                        serializeParam(
                                                      currentUserPhoto,
                                                      ParamType.String,
                                                    ),
                                                    'chatUser': serializeParam(
                                                      _model.grouChatDoc
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'groupName': serializeParam(
                                                      circleImageSubjectsRecord
                                                          .subjectName,
                                                      ParamType.String,
                                                    ),
                                                    'groupImage':
                                                        serializeParam(
                                                      circleImageSubjectsRecord
                                                          .subjectImage,
                                                      ParamType.String,
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
                                                    user: currentUserReference,
                                                    userA: currentUserReference,
                                                    lastSeen:
                                                        getCurrentTimestamp,
                                                    lastMessage:
                                                        circleImageSubjectsRecord
                                                            .level,
                                                    image:
                                                        circleImageSubjectsRecord
                                                            .subjectImage,
                                                    messageSeen: false,
                                                    subjectGroup:
                                                        circleImageSubjectsRecord
                                                            .reference,
                                                  ),
                                                  'GroupMembers': [
                                                    circleImageSubjectsRecord
                                                        .reference.id
                                                  ],
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Subject Added Successfully',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
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
                                    alignment: AlignmentDirectional(0.93, -1.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidCircle,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).titleMedium,
                          indicatorColor: Color(0xFF1F82E7),
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
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final subjects = (currentUserDocument
                                              ?.subjectRegistered
                                              ?.toList() ??
                                          [])
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: subjects.length,
                                    itemBuilder: (context, subjectsIndex) {
                                      final subjectsItem =
                                          subjects[subjectsIndex];
                                      return StreamBuilder<
                                          List<GroupChatsRecord>>(
                                        stream: queryGroupChatsRecord(
                                          queryBuilder: (groupChatsRecord) =>
                                              groupChatsRecord.where(
                                                  'SubjectGroup',
                                                  isEqualTo: subjectsItem),
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
                                              rowGroupChatsRecordList.isNotEmpty
                                                  ? rowGroupChatsRecordList
                                                      .first
                                                  : null;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'GroupChats',
                                                queryParameters: {
                                                  'userRef': serializeParam(
                                                    currentUserReference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'userProfile': serializeParam(
                                                    currentUserPhoto,
                                                    ParamType.String,
                                                  ),
                                                  'chatUser': serializeParam(
                                                    rowGroupChatsRecord
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'groupName': serializeParam(
                                                    'No GroupName',
                                                    ParamType.String,
                                                  ),
                                                  'groupImage': serializeParam(
                                                    rowGroupChatsRecord?.image,
                                                    ParamType.String,
                                                  ),
                                                  'subjectInfo': serializeParam(
                                                    subjectsItem,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.37, 0.34),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
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
                                                            final circleImageSubjectsRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                rowGroupChatsRecord!
                                                                    .image,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    if (rowGroupChatsRecord
                                                            ?.userA !=
                                                        currentUserReference)
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
                                                          child: badges.Badge(
                                                            badgeContent: Text(
                                                              '1+',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                            showBadge: true,
                                                            shape: badges
                                                                .BadgeShape
                                                                .circle,
                                                            badgeColor: Color(
                                                                0xC1078129),
                                                            elevation: 4.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            position: badges
                                                                    .BadgePosition
                                                                .topEnd(),
                                                            animationType: badges
                                                                .BadgeAnimationType
                                                                .scale,
                                                            toAnimate: true,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          80.0,
                                                                      child:
                                                                          SpinKitPumpingHeart(
                                                                        color: Color(
                                                                            0xC1295CFB),
                                                                        size:
                                                                            80.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final textSubjectsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Text(
                                                                  textSubjectsRecord
                                                                      .subjectName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                rowGroupChatsRecord!
                                                                    .lastMessage
                                                                    .maybeHandleOverflow(
                                                                        maxChars:
                                                                            12),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
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
                                                      .fromSTEB(0.0, 12.0, 12.0,
                                                          12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                          'Hm',
                                                          rowGroupChatsRecord!
                                                              .lastSeen!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      if (!rowGroupChatsRecord!
                                                          .messageSeen)
                                                        Icon(
                                                          Icons
                                                              .done_all_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      if (rowGroupChatsRecord
                                                              ?.messageSeen ??
                                                          true)
                                                        Icon(
                                                          Icons
                                                              .done_all_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          size: 24.0,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    controller: _model.listViewController2,
                                  );
                                },
                              ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) => usersRecord
                                      .where('schoolRegistered',
                                          isEqualTo: currentUserDocument
                                              ?.schoolRegistered)
                                      .where('Level',
                                          isEqualTo: valueOrDefault(
                                              currentUserDocument?.level, '')),
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
                                  List<UsersRecord> listViewUsersRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewUsersRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewUsersRecord =
                                          listViewUsersRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'profilePage',
                                              queryParameters: {
                                                'profile': serializeParam(
                                                  listViewUsersRecord.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Stack(
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
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          listViewUsersRecord
                                                              .photoUrl,
                                                          fit: BoxFit.cover,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          listViewUsersRecord
                                                              .level,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    controller: _model.listViewController3,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
