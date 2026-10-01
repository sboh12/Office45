import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersRecord extends FirestoreRecord {
  AnswersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ActivityRef" field.
  DocumentReference? _activityRef;
  DocumentReference? get activityRef => _activityRef;
  bool hasActivityRef() => _activityRef != null;

  // "SubmitFile" field.
  String? _submitFile;
  String get submitFile => _submitFile ?? '';
  bool hasSubmitFile() => _submitFile != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "Mark" field.
  int? _mark;
  int get mark => _mark ?? 0;
  bool hasMark() => _mark != null;

  // "Student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "Comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _activityRef = snapshotData['ActivityRef'] as DocumentReference?;
    _submitFile = snapshotData['SubmitFile'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _completed = snapshotData['completed'] as bool?;
    _mark = castToType<int>(snapshotData['Mark']);
    _student = snapshotData['Student'] as DocumentReference?;
    _comment = snapshotData['Comment'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Answers')
          : FirebaseFirestore.instance.collectionGroup('Answers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Answers').doc(id);

  static Stream<AnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswersRecord.fromSnapshot(s));

  static Future<AnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswersRecord.fromSnapshot(s));

  static AnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswersRecordData({
  DocumentReference? activityRef,
  String? submitFile,
  DateTime? createdAt,
  bool? completed,
  int? mark,
  DocumentReference? student,
  String? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ActivityRef': activityRef,
      'SubmitFile': submitFile,
      'created_at': createdAt,
      'completed': completed,
      'Mark': mark,
      'Student': student,
      'Comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswersRecordDocumentEquality implements Equality<AnswersRecord> {
  const AnswersRecordDocumentEquality();

  @override
  bool equals(AnswersRecord? e1, AnswersRecord? e2) {
    return e1?.activityRef == e2?.activityRef &&
        e1?.submitFile == e2?.submitFile &&
        e1?.createdAt == e2?.createdAt &&
        e1?.completed == e2?.completed &&
        e1?.mark == e2?.mark &&
        e1?.student == e2?.student &&
        e1?.comment == e2?.comment;
  }

  @override
  int hash(AnswersRecord? e) => const ListEquality().hash([
        e?.activityRef,
        e?.submitFile,
        e?.createdAt,
        e?.completed,
        e?.mark,
        e?.student,
        e?.comment
      ]);

  @override
  bool isValidKey(Object? o) => o is AnswersRecord;
}
