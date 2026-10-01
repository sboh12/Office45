import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallParticipantsRecord extends FirestoreRecord {
  CallParticipantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "call_id" field.
  DocumentReference? _callId;
  DocumentReference? get callId => _callId;
  bool hasCallId() => _callId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "join_time" field.
  DateTime? _joinTime;
  DateTime? get joinTime => _joinTime;
  bool hasJoinTime() => _joinTime != null;

  // "leave_time" field.
  DateTime? _leaveTime;
  DateTime? get leaveTime => _leaveTime;
  bool hasLeaveTime() => _leaveTime != null;

  // "duration_seconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  bool hasDurationSeconds() => _durationSeconds != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _callId = snapshotData['call_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _joinTime = snapshotData['join_time'] as DateTime?;
    _leaveTime = snapshotData['leave_time'] as DateTime?;
    _durationSeconds = castToType<int>(snapshotData['duration_seconds']);
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('call_participants');

  static Stream<CallParticipantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CallParticipantsRecord.fromSnapshot(s));

  static Future<CallParticipantsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CallParticipantsRecord.fromSnapshot(s));

  static CallParticipantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CallParticipantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CallParticipantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CallParticipantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CallParticipantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CallParticipantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCallParticipantsRecordData({
  DocumentReference? callId,
  DocumentReference? userId,
  DateTime? joinTime,
  DateTime? leaveTime,
  int? durationSeconds,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'call_id': callId,
      'user_id': userId,
      'join_time': joinTime,
      'leave_time': leaveTime,
      'duration_seconds': durationSeconds,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CallParticipantsRecordDocumentEquality
    implements Equality<CallParticipantsRecord> {
  const CallParticipantsRecordDocumentEquality();

  @override
  bool equals(CallParticipantsRecord? e1, CallParticipantsRecord? e2) {
    return e1?.callId == e2?.callId &&
        e1?.userId == e2?.userId &&
        e1?.joinTime == e2?.joinTime &&
        e1?.leaveTime == e2?.leaveTime &&
        e1?.durationSeconds == e2?.durationSeconds &&
        e1?.status == e2?.status;
  }

  @override
  int hash(CallParticipantsRecord? e) => const ListEquality().hash([
        e?.callId,
        e?.userId,
        e?.joinTime,
        e?.leaveTime,
        e?.durationSeconds,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is CallParticipantsRecord;
}
