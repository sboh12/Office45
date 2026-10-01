import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRatingRecord extends FirestoreRecord {
  NotesRatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notesRef" field.
  DocumentReference? _notesRef;
  DocumentReference? get notesRef => _notesRef;
  bool hasNotesRef() => _notesRef != null;

  // "studentRef" field.
  DocumentReference? _studentRef;
  DocumentReference? get studentRef => _studentRef;
  bool hasStudentRef() => _studentRef != null;

  // "readTime" field.
  int? _readTime;
  int get readTime => _readTime ?? 0;
  bool hasReadTime() => _readTime != null;

  // "ratingStars" field.
  int? _ratingStars;
  int get ratingStars => _ratingStars ?? 0;
  bool hasRatingStars() => _ratingStars != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notesRef = snapshotData['notesRef'] as DocumentReference?;
    _studentRef = snapshotData['studentRef'] as DocumentReference?;
    _readTime = castToType<int>(snapshotData['readTime']);
    _ratingStars = castToType<int>(snapshotData['ratingStars']);
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notesRating')
          : FirebaseFirestore.instance.collectionGroup('notesRating');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notesRating').doc(id);

  static Stream<NotesRatingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRatingRecord.fromSnapshot(s));

  static Future<NotesRatingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRatingRecord.fromSnapshot(s));

  static NotesRatingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotesRatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRatingRecordData({
  DocumentReference? notesRef,
  DocumentReference? studentRef,
  int? readTime,
  int? ratingStars,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notesRef': notesRef,
      'studentRef': studentRef,
      'readTime': readTime,
      'ratingStars': ratingStars,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRatingRecordDocumentEquality implements Equality<NotesRatingRecord> {
  const NotesRatingRecordDocumentEquality();

  @override
  bool equals(NotesRatingRecord? e1, NotesRatingRecord? e2) {
    return e1?.notesRef == e2?.notesRef &&
        e1?.studentRef == e2?.studentRef &&
        e1?.readTime == e2?.readTime &&
        e1?.ratingStars == e2?.ratingStars &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(NotesRatingRecord? e) => const ListEquality().hash(
      [e?.notesRef, e?.studentRef, e?.readTime, e?.ratingStars, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is NotesRatingRecord;
}
