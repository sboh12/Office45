import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnouncementRecord extends FirestoreRecord {
  AnnouncementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AnnName" field.
  String? _annName;
  String get annName => _annName ?? '';
  bool hasAnnName() => _annName != null;

  // "AnnType" field.
  String? _annType;
  String get annType => _annType ?? '';
  bool hasAnnType() => _annType != null;

  // "AnnDueDate" field.
  DateTime? _annDueDate;
  DateTime? get annDueDate => _annDueDate;
  bool hasAnnDueDate() => _annDueDate != null;

  // "AnnAuthor" field.
  DocumentReference? _annAuthor;
  DocumentReference? get annAuthor => _annAuthor;
  bool hasAnnAuthor() => _annAuthor != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _annName = snapshotData['AnnName'] as String?;
    _annType = snapshotData['AnnType'] as String?;
    _annDueDate = snapshotData['AnnDueDate'] as DateTime?;
    _annAuthor = snapshotData['AnnAuthor'] as DocumentReference?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Announcement')
          : FirebaseFirestore.instance.collectionGroup('Announcement');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Announcement').doc();

  static Stream<AnnouncementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnnouncementRecord.fromSnapshot(s));

  static Future<AnnouncementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnnouncementRecord.fromSnapshot(s));

  static AnnouncementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnouncementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnouncementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnouncementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnouncementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnouncementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnouncementRecordData({
  String? annName,
  String? annType,
  DateTime? annDueDate,
  DocumentReference? annAuthor,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AnnName': annName,
      'AnnType': annType,
      'AnnDueDate': annDueDate,
      'AnnAuthor': annAuthor,
      'Created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnnouncementRecordDocumentEquality
    implements Equality<AnnouncementRecord> {
  const AnnouncementRecordDocumentEquality();

  @override
  bool equals(AnnouncementRecord? e1, AnnouncementRecord? e2) {
    return e1?.annName == e2?.annName &&
        e1?.annType == e2?.annType &&
        e1?.annDueDate == e2?.annDueDate &&
        e1?.annAuthor == e2?.annAuthor &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(AnnouncementRecord? e) => const ListEquality().hash(
      [e?.annName, e?.annType, e?.annDueDate, e?.annAuthor, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is AnnouncementRecord;
}
