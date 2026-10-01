import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Curriculum teacher preferes
class CurriculumRecord extends FirestoreRecord {
  CurriculumRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "DateStart" field.
  DateTime? _dateStart;
  DateTime? get dateStart => _dateStart;
  bool hasDateStart() => _dateStart != null;

  // "DateEnd" field.
  DateTime? _dateEnd;
  DateTime? get dateEnd => _dateEnd;
  bool hasDateEnd() => _dateEnd != null;

  // "Week" field.
  int? _week;
  int get week => _week ?? 0;
  bool hasWeek() => _week != null;

  // "DocumentSummary" field.
  DocumentReference? _documentSummary;
  DocumentReference? get documentSummary => _documentSummary;
  bool hasDocumentSummary() => _documentSummary != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _dateStart = snapshotData['DateStart'] as DateTime?;
    _dateEnd = snapshotData['DateEnd'] as DateTime?;
    _week = castToType<int>(snapshotData['Week']);
    _documentSummary = snapshotData['DocumentSummary'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Curriculum')
          : FirebaseFirestore.instance.collectionGroup('Curriculum');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Curriculum').doc(id);

  static Stream<CurriculumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurriculumRecord.fromSnapshot(s));

  static Future<CurriculumRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CurriculumRecord.fromSnapshot(s));

  static CurriculumRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurriculumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurriculumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurriculumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurriculumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurriculumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurriculumRecordData({
  String? title,
  String? description,
  DateTime? createdAt,
  DateTime? dateStart,
  DateTime? dateEnd,
  int? week,
  DocumentReference? documentSummary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'created_at': createdAt,
      'DateStart': dateStart,
      'DateEnd': dateEnd,
      'Week': week,
      'DocumentSummary': documentSummary,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurriculumRecordDocumentEquality implements Equality<CurriculumRecord> {
  const CurriculumRecordDocumentEquality();

  @override
  bool equals(CurriculumRecord? e1, CurriculumRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.dateStart == e2?.dateStart &&
        e1?.dateEnd == e2?.dateEnd &&
        e1?.week == e2?.week &&
        e1?.documentSummary == e2?.documentSummary;
  }

  @override
  int hash(CurriculumRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.createdAt,
        e?.dateStart,
        e?.dateEnd,
        e?.week,
        e?.documentSummary
      ]);

  @override
  bool isValidKey(Object? o) => o is CurriculumRecord;
}
