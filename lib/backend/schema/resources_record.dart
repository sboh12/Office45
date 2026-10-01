import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResourcesRecord extends FirestoreRecord {
  ResourcesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ExamName" field.
  String? _examName;
  String get examName => _examName ?? '';
  bool hasExamName() => _examName != null;

  // "ExamType" field.
  String? _examType;
  String get examType => _examType ?? '';
  bool hasExamType() => _examType != null;

  // "ExamFile" field.
  String? _examFile;
  String get examFile => _examFile ?? '';
  bool hasExamFile() => _examFile != null;

  // "ExamYear" field.
  DateTime? _examYear;
  DateTime? get examYear => _examYear;
  bool hasExamYear() => _examYear != null;

  // "ExamMemo" field.
  String? _examMemo;
  String get examMemo => _examMemo ?? '';
  bool hasExamMemo() => _examMemo != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _examName = snapshotData['ExamName'] as String?;
    _examType = snapshotData['ExamType'] as String?;
    _examFile = snapshotData['ExamFile'] as String?;
    _examYear = snapshotData['ExamYear'] as DateTime?;
    _examMemo = snapshotData['ExamMemo'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Resources')
          : FirebaseFirestore.instance.collectionGroup('Resources');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Resources').doc(id);

  static Stream<ResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResourcesRecord.fromSnapshot(s));

  static Future<ResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResourcesRecord.fromSnapshot(s));

  static ResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResourcesRecordData({
  String? examName,
  String? examType,
  String? examFile,
  DateTime? examYear,
  String? examMemo,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ExamName': examName,
      'ExamType': examType,
      'ExamFile': examFile,
      'ExamYear': examYear,
      'ExamMemo': examMemo,
      'Created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResourcesRecordDocumentEquality implements Equality<ResourcesRecord> {
  const ResourcesRecordDocumentEquality();

  @override
  bool equals(ResourcesRecord? e1, ResourcesRecord? e2) {
    return e1?.examName == e2?.examName &&
        e1?.examType == e2?.examType &&
        e1?.examFile == e2?.examFile &&
        e1?.examYear == e2?.examYear &&
        e1?.examMemo == e2?.examMemo &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ResourcesRecord? e) => const ListEquality().hash([
        e?.examName,
        e?.examType,
        e?.examFile,
        e?.examYear,
        e?.examMemo,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ResourcesRecord;
}
