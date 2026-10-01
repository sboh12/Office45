import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActiveCallRecord extends FirestoreRecord {
  ActiveCallRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "call_id" field.
  String? _callId;
  String get callId => _callId ?? '';
  bool hasCallId() => _callId != null;

  // "started_at" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  // "initiator" field.
  DocumentReference? _initiator;
  DocumentReference? get initiator => _initiator;
  bool hasInitiator() => _initiator != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _callId = snapshotData['call_id'] as String?;
    _startedAt = snapshotData['started_at'] as DateTime?;
    _initiator = snapshotData['initiator'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('active_call')
          : FirebaseFirestore.instance.collectionGroup('active_call');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('active_call').doc(id);

  static Stream<ActiveCallRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActiveCallRecord.fromSnapshot(s));

  static Future<ActiveCallRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActiveCallRecord.fromSnapshot(s));

  static ActiveCallRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActiveCallRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActiveCallRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActiveCallRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActiveCallRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActiveCallRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActiveCallRecordData({
  String? callId,
  DateTime? startedAt,
  DocumentReference? initiator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'call_id': callId,
      'started_at': startedAt,
      'initiator': initiator,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActiveCallRecordDocumentEquality implements Equality<ActiveCallRecord> {
  const ActiveCallRecordDocumentEquality();

  @override
  bool equals(ActiveCallRecord? e1, ActiveCallRecord? e2) {
    return e1?.callId == e2?.callId &&
        e1?.startedAt == e2?.startedAt &&
        e1?.initiator == e2?.initiator;
  }

  @override
  int hash(ActiveCallRecord? e) =>
      const ListEquality().hash([e?.callId, e?.startedAt, e?.initiator]);

  @override
  bool isValidKey(Object? o) => o is ActiveCallRecord;
}
