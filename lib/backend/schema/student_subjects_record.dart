import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentSubjectsRecord extends FirestoreRecord {
  StudentSubjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "selectedStudents" field.
  DocumentReference? _selectedStudents;
  DocumentReference? get selectedStudents => _selectedStudents;
  bool hasSelectedStudents() => _selectedStudents != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _selectedStudents = snapshotData['selectedStudents'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('StudentSubjects')
          : FirebaseFirestore.instance.collectionGroup('StudentSubjects');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('StudentSubjects').doc(id);

  static Stream<StudentSubjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentSubjectsRecord.fromSnapshot(s));

  static Future<StudentSubjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentSubjectsRecord.fromSnapshot(s));

  static StudentSubjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentSubjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentSubjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentSubjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentSubjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentSubjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentSubjectsRecordData({
  DocumentReference? selectedStudents,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'selectedStudents': selectedStudents,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentSubjectsRecordDocumentEquality
    implements Equality<StudentSubjectsRecord> {
  const StudentSubjectsRecordDocumentEquality();

  @override
  bool equals(StudentSubjectsRecord? e1, StudentSubjectsRecord? e2) {
    return e1?.selectedStudents == e2?.selectedStudents;
  }

  @override
  int hash(StudentSubjectsRecord? e) =>
      const ListEquality().hash([e?.selectedStudents]);

  @override
  bool isValidKey(Object? o) => o is StudentSubjectsRecord;
}
