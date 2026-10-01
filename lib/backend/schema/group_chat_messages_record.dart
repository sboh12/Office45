import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupChatMessagesRecord extends FirestoreRecord {
  GroupChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "chat_user" field.
  DocumentReference? _chatUser;
  DocumentReference? get chatUser => _chatUser;
  bool hasChatUser() => _chatUser != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "message_type" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _image = snapshotData['Image'] as String?;
    _chatUser = snapshotData['chat_user'] as DocumentReference?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _video = snapshotData['video'] as String?;
    _messageType = snapshotData['message_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groupChatMessages');

  static Stream<GroupChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupChatMessagesRecord.fromSnapshot(s));

  static Future<GroupChatMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GroupChatMessagesRecord.fromSnapshot(s));

  static GroupChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupChatMessagesRecordData({
  DocumentReference? user,
  String? text,
  DateTime? timestamp,
  String? image,
  DocumentReference? chatUser,
  DateTime? dateCreated,
  String? video,
  String? messageType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'text': text,
      'timestamp': timestamp,
      'Image': image,
      'chat_user': chatUser,
      'dateCreated': dateCreated,
      'video': video,
      'message_type': messageType,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupChatMessagesRecordDocumentEquality
    implements Equality<GroupChatMessagesRecord> {
  const GroupChatMessagesRecordDocumentEquality();

  @override
  bool equals(GroupChatMessagesRecord? e1, GroupChatMessagesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.image == e2?.image &&
        e1?.chatUser == e2?.chatUser &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.video == e2?.video &&
        e1?.messageType == e2?.messageType;
  }

  @override
  int hash(GroupChatMessagesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.text,
        e?.timestamp,
        e?.image,
        e?.chatUser,
        e?.dateCreated,
        e?.video,
        e?.messageType
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupChatMessagesRecord;
}
