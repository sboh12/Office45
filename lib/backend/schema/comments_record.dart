import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NotesComment" field.
  DocumentReference? _notesComment;
  DocumentReference? get notesComment => _notesComment;
  bool hasNotesComment() => _notesComment != null;

  // "Commenter" field.
  DocumentReference? _commenter;
  DocumentReference? get commenter => _commenter;
  bool hasCommenter() => _commenter != null;

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
    _notesComment = snapshotData['NotesComment'] as DocumentReference?;
    _commenter = snapshotData['Commenter'] as DocumentReference?;
    _comment = snapshotData['Comment'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Comments')
          : FirebaseFirestore.instance.collectionGroup('Comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? notesComment,
  DocumentReference? commenter,
  String? comment,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NotesComment': notesComment,
      'Commenter': commenter,
      'Comment': comment,
      'Created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.notesComment == e2?.notesComment &&
        e1?.commenter == e2?.commenter &&
        e1?.comment == e2?.comment &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.notesComment, e?.commenter, e?.comment, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
