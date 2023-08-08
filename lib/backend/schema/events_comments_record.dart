import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsCommentsRecord extends FirestoreRecord {
  EventsCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "EventComments" field.
  DocumentReference? _eventComments;
  DocumentReference? get eventComments => _eventComments;
  bool hasEventComments() => _eventComments != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commenter = snapshotData['Commenter'] as DocumentReference?;
    _comment = snapshotData['Comment'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _eventComments = snapshotData['EventComments'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('EventsComments')
          : FirebaseFirestore.instance.collectionGroup('EventsComments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('EventsComments').doc();

  static Stream<EventsCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsCommentsRecord.fromSnapshot(s));

  static Future<EventsCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsCommentsRecord.fromSnapshot(s));

  static EventsCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventsCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsCommentsRecordData({
  DocumentReference? commenter,
  String? comment,
  DateTime? createdAt,
  DocumentReference? eventComments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Commenter': commenter,
      'Comment': comment,
      'Created_at': createdAt,
      'EventComments': eventComments,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsCommentsRecordDocumentEquality
    implements Equality<EventsCommentsRecord> {
  const EventsCommentsRecordDocumentEquality();

  @override
  bool equals(EventsCommentsRecord? e1, EventsCommentsRecord? e2) {
    return e1?.commenter == e2?.commenter &&
        e1?.comment == e2?.comment &&
        e1?.createdAt == e2?.createdAt &&
        e1?.eventComments == e2?.eventComments;
  }

  @override
  int hash(EventsCommentsRecord? e) => const ListEquality()
      .hash([e?.commenter, e?.comment, e?.createdAt, e?.eventComments]);

  @override
  bool isValidKey(Object? o) => o is EventsCommentsRecord;
}
