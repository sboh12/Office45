import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupChatsRecord extends FirestoreRecord {
  GroupChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "last_seen" field.
  DateTime? _lastSeen;
  DateTime? get lastSeen => _lastSeen;
  bool hasLastSeen() => _lastSeen != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "messageSeen" field.
  bool? _messageSeen;
  bool get messageSeen => _messageSeen ?? false;
  bool hasMessageSeen() => _messageSeen != null;

  // "GroupMembers" field.
  List<String>? _groupMembers;
  List<String> get groupMembers => _groupMembers ?? const [];
  bool hasGroupMembers() => _groupMembers != null;

  // "GroupData" field.
  DocumentReference? _groupData;
  DocumentReference? get groupData => _groupData;
  bool hasGroupData() => _groupData != null;

  // "ChatMembers" field.
  List<DocumentReference>? _chatMembers;
  List<DocumentReference> get chatMembers => _chatMembers ?? const [];
  bool hasChatMembers() => _chatMembers != null;

  // "SubjectGroup" field.
  DocumentReference? _subjectGroup;
  DocumentReference? get subjectGroup => _subjectGroup;
  bool hasSubjectGroup() => _subjectGroup != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userA = snapshotData['user_a'] as DocumentReference?;
    _lastSeen = snapshotData['last_seen'] as DateTime?;
    _lastMessage = snapshotData['last_message'] as String?;
    _image = snapshotData['Image'] as String?;
    _messageSeen = snapshotData['messageSeen'] as bool?;
    _groupMembers = getDataList(snapshotData['GroupMembers']);
    _groupData = snapshotData['GroupData'] as DocumentReference?;
    _chatMembers = getDataList(snapshotData['ChatMembers']);
    _subjectGroup = snapshotData['SubjectGroup'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groupChats');

  static Stream<GroupChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupChatsRecord.fromSnapshot(s));

  static Future<GroupChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupChatsRecord.fromSnapshot(s));

  static GroupChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupChatsRecordData({
  DocumentReference? user,
  DocumentReference? userA,
  DateTime? lastSeen,
  String? lastMessage,
  String? image,
  bool? messageSeen,
  DocumentReference? groupData,
  DocumentReference? subjectGroup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'user_a': userA,
      'last_seen': lastSeen,
      'last_message': lastMessage,
      'Image': image,
      'messageSeen': messageSeen,
      'GroupData': groupData,
      'SubjectGroup': subjectGroup,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupChatsRecordDocumentEquality implements Equality<GroupChatsRecord> {
  const GroupChatsRecordDocumentEquality();

  @override
  bool equals(GroupChatsRecord? e1, GroupChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.userA == e2?.userA &&
        e1?.lastSeen == e2?.lastSeen &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.image == e2?.image &&
        e1?.messageSeen == e2?.messageSeen &&
        listEquality.equals(e1?.groupMembers, e2?.groupMembers) &&
        e1?.groupData == e2?.groupData &&
        listEquality.equals(e1?.chatMembers, e2?.chatMembers) &&
        e1?.subjectGroup == e2?.subjectGroup;
  }

  @override
  int hash(GroupChatsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.userA,
        e?.lastSeen,
        e?.lastMessage,
        e?.image,
        e?.messageSeen,
        e?.groupMembers,
        e?.groupData,
        e?.chatMembers,
        e?.subjectGroup
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupChatsRecord;
}
