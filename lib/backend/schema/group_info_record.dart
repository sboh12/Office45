import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupInfoRecord extends FirestoreRecord {
  GroupInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "GroupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "Admin" field.
  DocumentReference? _admin;
  DocumentReference? get admin => _admin;
  bool hasAdmin() => _admin != null;

  // "GroupProfile" field.
  String? _groupProfile;
  String get groupProfile => _groupProfile ?? '';
  bool hasGroupProfile() => _groupProfile != null;

  // "GroupMembers" field.
  List<String>? _groupMembers;
  List<String> get groupMembers => _groupMembers ?? const [];
  bool hasGroupMembers() => _groupMembers != null;

  // "ChatMembers" field.
  List<DocumentReference>? _chatMembers;
  List<DocumentReference> get chatMembers => _chatMembers ?? const [];
  bool hasChatMembers() => _chatMembers != null;

  // "SubjectSelected" field.
  DocumentReference? _subjectSelected;
  DocumentReference? get subjectSelected => _subjectSelected;
  bool hasSubjectSelected() => _subjectSelected != null;

  void _initializeFields() {
    _groupName = snapshotData['GroupName'] as String?;
    _admin = snapshotData['Admin'] as DocumentReference?;
    _groupProfile = snapshotData['GroupProfile'] as String?;
    _groupMembers = getDataList(snapshotData['GroupMembers']);
    _chatMembers = getDataList(snapshotData['ChatMembers']);
    _subjectSelected = snapshotData['SubjectSelected'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('GroupInfo');

  static Stream<GroupInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupInfoRecord.fromSnapshot(s));

  static Future<GroupInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupInfoRecord.fromSnapshot(s));

  static GroupInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupInfoRecordData({
  String? groupName,
  DocumentReference? admin,
  String? groupProfile,
  DocumentReference? subjectSelected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GroupName': groupName,
      'Admin': admin,
      'GroupProfile': groupProfile,
      'SubjectSelected': subjectSelected,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupInfoRecordDocumentEquality implements Equality<GroupInfoRecord> {
  const GroupInfoRecordDocumentEquality();

  @override
  bool equals(GroupInfoRecord? e1, GroupInfoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupName == e2?.groupName &&
        e1?.admin == e2?.admin &&
        e1?.groupProfile == e2?.groupProfile &&
        listEquality.equals(e1?.groupMembers, e2?.groupMembers) &&
        listEquality.equals(e1?.chatMembers, e2?.chatMembers) &&
        e1?.subjectSelected == e2?.subjectSelected;
  }

  @override
  int hash(GroupInfoRecord? e) => const ListEquality().hash([
        e?.groupName,
        e?.admin,
        e?.groupProfile,
        e?.groupMembers,
        e?.chatMembers,
        e?.subjectSelected
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupInfoRecord;
}
