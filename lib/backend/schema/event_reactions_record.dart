import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventReactionsRecord extends FirestoreRecord {
  EventReactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Like" field.
  int? _like;
  int get like => _like ?? 0;
  bool hasLike() => _like != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _like = castToType<int>(snapshotData['Like']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('EventReactions')
          : FirebaseFirestore.instance.collectionGroup('EventReactions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('EventReactions').doc(id);

  static Stream<EventReactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventReactionsRecord.fromSnapshot(s));

  static Future<EventReactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventReactionsRecord.fromSnapshot(s));

  static EventReactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventReactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventReactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventReactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventReactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventReactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventReactionsRecordData({
  DateTime? createdAt,
  int? like,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Created_at': createdAt,
      'Like': like,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventReactionsRecordDocumentEquality
    implements Equality<EventReactionsRecord> {
  const EventReactionsRecordDocumentEquality();

  @override
  bool equals(EventReactionsRecord? e1, EventReactionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt && e1?.like == e2?.like;
  }

  @override
  int hash(EventReactionsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.like]);

  @override
  bool isValidKey(Object? o) => o is EventReactionsRecord;
}
