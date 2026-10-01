import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassRateRecord extends FirestoreRecord {
  PassRateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  bool hasGrade() => _grade != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "term" field.
  int? _term;
  int get term => _term ?? 0;
  bool hasTerm() => _term != null;

  // "addby" field.
  DocumentReference? _addby;
  DocumentReference? get addby => _addby;
  bool hasAddby() => _addby != null;

  // "percentage" field.
  List<int>? _percentage;
  List<int> get percentage => _percentage ?? const [];
  bool hasPercentage() => _percentage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _grade = castToType<int>(snapshotData['grade']);
    _year = castToType<int>(snapshotData['year']);
    _term = castToType<int>(snapshotData['term']);
    _addby = snapshotData['addby'] as DocumentReference?;
    _percentage = getDataList(snapshotData['percentage']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PassRate')
          : FirebaseFirestore.instance.collectionGroup('PassRate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PassRate').doc(id);

  static Stream<PassRateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassRateRecord.fromSnapshot(s));

  static Future<PassRateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassRateRecord.fromSnapshot(s));

  static PassRateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassRateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassRateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassRateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PassRateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PassRateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPassRateRecordData({
  DateTime? createdAt,
  int? grade,
  int? year,
  int? term,
  DocumentReference? addby,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'grade': grade,
      'year': year,
      'term': term,
      'addby': addby,
    }.withoutNulls,
  );

  return firestoreData;
}

class PassRateRecordDocumentEquality implements Equality<PassRateRecord> {
  const PassRateRecordDocumentEquality();

  @override
  bool equals(PassRateRecord? e1, PassRateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.grade == e2?.grade &&
        e1?.year == e2?.year &&
        e1?.term == e2?.term &&
        e1?.addby == e2?.addby &&
        listEquality.equals(e1?.percentage, e2?.percentage);
  }

  @override
  int hash(PassRateRecord? e) => const ListEquality().hash(
      [e?.createdAt, e?.grade, e?.year, e?.term, e?.addby, e?.percentage]);

  @override
  bool isValidKey(Object? o) => o is PassRateRecord;
}
