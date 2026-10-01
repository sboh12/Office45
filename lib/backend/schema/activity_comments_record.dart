import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityCommentsRecord extends FirestoreRecord {
  ActivityCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Commenter" field.
  DocumentReference? _commenter;
  DocumentReference? get commenter => _commenter;
  bool hasCommenter() => _commenter != null;

  // "ActivityComment" field.
  DocumentReference? _activityComment;
  DocumentReference? get activityComment => _activityComment;
  bool hasActivityComment() => _activityComment != null;

  // "Comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commenter = snapshotData['Commenter'] as DocumentReference?;
    _activityComment = snapshotData['ActivityComment'] as DocumentReference?;
    _comment = snapshotData['Comment'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ActivityComments')
          : FirebaseFirestore.instance.collectionGroup('ActivityComments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ActivityComments').doc(id);

  static Stream<ActivityCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityCommentsRecord.fromSnapshot(s));

  static Future<ActivityCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActivityCommentsRecord.fromSnapshot(s));

  static ActivityCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityCommentsRecordData({
  DocumentReference? commenter,
  DocumentReference? activityComment,
  String? comment,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Commenter': commenter,
      'ActivityComment': activityComment,
      'Comment': comment,
      'Created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityCommentsRecordDocumentEquality
    implements Equality<ActivityCommentsRecord> {
  const ActivityCommentsRecordDocumentEquality();

  @override
  bool equals(ActivityCommentsRecord? e1, ActivityCommentsRecord? e2) {
    return e1?.commenter == e2?.commenter &&
        e1?.activityComment == e2?.activityComment &&
        e1?.comment == e2?.comment &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ActivityCommentsRecord? e) => const ListEquality()
      .hash([e?.commenter, e?.activityComment, e?.comment, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ActivityCommentsRecord;
}
