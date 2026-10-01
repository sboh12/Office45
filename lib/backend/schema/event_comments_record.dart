import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventCommentsRecord extends FirestoreRecord {
  EventCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "commenter" field.
  DocumentReference? _commenter;
  DocumentReference? get commenter => _commenter;
  bool hasCommenter() => _commenter != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commenter = snapshotData['commenter'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _event = snapshotData['event'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('EventComments')
          : FirebaseFirestore.instance.collectionGroup('EventComments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('EventComments').doc(id);

  static Stream<EventCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventCommentsRecord.fromSnapshot(s));

  static Future<EventCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventCommentsRecord.fromSnapshot(s));

  static EventCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventCommentsRecordData({
  DocumentReference? commenter,
  String? comment,
  DocumentReference? event,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'commenter': commenter,
      'comment': comment,
      'event': event,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventCommentsRecordDocumentEquality
    implements Equality<EventCommentsRecord> {
  const EventCommentsRecordDocumentEquality();

  @override
  bool equals(EventCommentsRecord? e1, EventCommentsRecord? e2) {
    return e1?.commenter == e2?.commenter &&
        e1?.comment == e2?.comment &&
        e1?.event == e2?.event &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(EventCommentsRecord? e) => const ListEquality()
      .hash([e?.commenter, e?.comment, e?.event, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is EventCommentsRecord;
}
