import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatHistoryRecord extends FirestoreRecord {
  ChatHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "call_id" field.
  String? _callId;
  String get callId => _callId ?? '';
  bool hasCallId() => _callId != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "duration_seconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  bool hasDurationSeconds() => _durationSeconds != null;

  // "call_type" field.
  String? _callType;
  String get callType => _callType ?? '';
  bool hasCallType() => _callType != null;

  // "group_id" field.
  DocumentReference? _groupId;
  DocumentReference? get groupId => _groupId;
  bool hasGroupId() => _groupId != null;

  // "initiator" field.
  DocumentReference? _initiator;
  DocumentReference? get initiator => _initiator;
  bool hasInitiator() => _initiator != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _callId = snapshotData['call_id'] as String?;
    _participants = getDataList(snapshotData['participants']);
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _durationSeconds = castToType<int>(snapshotData['duration_seconds']);
    _callType = snapshotData['call_type'] as String?;
    _groupId = snapshotData['group_id'] as DocumentReference?;
    _initiator = snapshotData['initiator'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_history');

  static Stream<ChatHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatHistoryRecord.fromSnapshot(s));

  static Future<ChatHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatHistoryRecord.fromSnapshot(s));

  static ChatHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatHistoryRecordData({
  String? callId,
  DateTime? startTime,
  DateTime? endTime,
  int? durationSeconds,
  String? callType,
  DocumentReference? groupId,
  DocumentReference? initiator,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'call_id': callId,
      'start_time': startTime,
      'end_time': endTime,
      'duration_seconds': durationSeconds,
      'call_type': callType,
      'group_id': groupId,
      'initiator': initiator,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatHistoryRecordDocumentEquality implements Equality<ChatHistoryRecord> {
  const ChatHistoryRecordDocumentEquality();

  @override
  bool equals(ChatHistoryRecord? e1, ChatHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.callId == e2?.callId &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.durationSeconds == e2?.durationSeconds &&
        e1?.callType == e2?.callType &&
        e1?.groupId == e2?.groupId &&
        e1?.initiator == e2?.initiator &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ChatHistoryRecord? e) => const ListEquality().hash([
        e?.callId,
        e?.participants,
        e?.startTime,
        e?.endTime,
        e?.durationSeconds,
        e?.callType,
        e?.groupId,
        e?.initiator,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatHistoryRecord;
}
