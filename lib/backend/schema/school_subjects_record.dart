import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolSubjectsRecord extends FirestoreRecord {
  SchoolSubjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "SubjectSelected" field.
  DocumentReference? _subjectSelected;
  DocumentReference? get subjectSelected => _subjectSelected;
  bool hasSubjectSelected() => _subjectSelected != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _subjectSelected = snapshotData['SubjectSelected'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SchoolSubjects')
          : FirebaseFirestore.instance.collectionGroup('SchoolSubjects');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('SchoolSubjects').doc();

  static Stream<SchoolSubjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolSubjectsRecord.fromSnapshot(s));

  static Future<SchoolSubjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolSubjectsRecord.fromSnapshot(s));

  static SchoolSubjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolSubjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolSubjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolSubjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolSubjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolSubjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolSubjectsRecordData({
  DocumentReference? subjectSelected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SubjectSelected': subjectSelected,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolSubjectsRecordDocumentEquality
    implements Equality<SchoolSubjectsRecord> {
  const SchoolSubjectsRecordDocumentEquality();

  @override
  bool equals(SchoolSubjectsRecord? e1, SchoolSubjectsRecord? e2) {
    return e1?.subjectSelected == e2?.subjectSelected;
  }

  @override
  int hash(SchoolSubjectsRecord? e) =>
      const ListEquality().hash([e?.subjectSelected]);

  @override
  bool isValidKey(Object? o) => o is SchoolSubjectsRecord;
}
