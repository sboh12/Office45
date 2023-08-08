import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectsRecord extends FirestoreRecord {
  SubjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "SubjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  // "Teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "Level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  // "subjectImage" field.
  String? _subjectImage;
  String get subjectImage => _subjectImage ?? '';
  bool hasSubjectImage() => _subjectImage != null;

  // "Highlights" field.
  String? _highlights;
  String get highlights => _highlights ?? '';
  bool hasHighlights() => _highlights != null;

  // "Count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "subjectLeader" field.
  DocumentReference? _subjectLeader;
  DocumentReference? get subjectLeader => _subjectLeader;
  bool hasSubjectLeader() => _subjectLeader != null;

  // "schoolSubject" field.
  DocumentReference? _schoolSubject;
  DocumentReference? get schoolSubject => _schoolSubject;
  bool hasSchoolSubject() => _schoolSubject != null;

  void _initializeFields() {
    _subjectName = snapshotData['SubjectName'] as String?;
    _teacher = snapshotData['Teacher'] as DocumentReference?;
    _level = snapshotData['Level'] as String?;
    _subjectImage = snapshotData['subjectImage'] as String?;
    _highlights = snapshotData['Highlights'] as String?;
    _count = castToType<int>(snapshotData['Count']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _subjectLeader = snapshotData['subjectLeader'] as DocumentReference?;
    _schoolSubject = snapshotData['schoolSubject'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Subjects');

  static Stream<SubjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectsRecord.fromSnapshot(s));

  static Future<SubjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectsRecord.fromSnapshot(s));

  static SubjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectsRecordData({
  String? subjectName,
  DocumentReference? teacher,
  String? level,
  String? subjectImage,
  String? highlights,
  int? count,
  DateTime? createdAt,
  DocumentReference? subjectLeader,
  DocumentReference? schoolSubject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SubjectName': subjectName,
      'Teacher': teacher,
      'Level': level,
      'subjectImage': subjectImage,
      'Highlights': highlights,
      'Count': count,
      'created_at': createdAt,
      'subjectLeader': subjectLeader,
      'schoolSubject': schoolSubject,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubjectsRecordDocumentEquality implements Equality<SubjectsRecord> {
  const SubjectsRecordDocumentEquality();

  @override
  bool equals(SubjectsRecord? e1, SubjectsRecord? e2) {
    return e1?.subjectName == e2?.subjectName &&
        e1?.teacher == e2?.teacher &&
        e1?.level == e2?.level &&
        e1?.subjectImage == e2?.subjectImage &&
        e1?.highlights == e2?.highlights &&
        e1?.count == e2?.count &&
        e1?.createdAt == e2?.createdAt &&
        e1?.subjectLeader == e2?.subjectLeader &&
        e1?.schoolSubject == e2?.schoolSubject;
  }

  @override
  int hash(SubjectsRecord? e) => const ListEquality().hash([
        e?.subjectName,
        e?.teacher,
        e?.level,
        e?.subjectImage,
        e?.highlights,
        e?.count,
        e?.createdAt,
        e?.subjectLeader,
        e?.schoolSubject
      ]);

  @override
  bool isValidKey(Object? o) => o is SubjectsRecord;
}
