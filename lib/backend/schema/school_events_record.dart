import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolEventsRecord extends FirestoreRecord {
  SchoolEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "EventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "EventPoster" field.
  List<String>? _eventPoster;
  List<String> get eventPoster => _eventPoster ?? const [];
  bool hasEventPoster() => _eventPoster != null;

  // "EventDate" field.
  String? _eventDate;
  String get eventDate => _eventDate ?? '';
  bool hasEventDate() => _eventDate != null;

  // "SchoolEvent" field.
  DocumentReference? _schoolEvent;
  DocumentReference? get schoolEvent => _schoolEvent;
  bool hasSchoolEvent() => _schoolEvent != null;

  // "OtherSchools" field.
  List<DocumentReference>? _otherSchools;
  List<DocumentReference> get otherSchools => _otherSchools ?? const [];
  bool hasOtherSchools() => _otherSchools != null;

  // "EventOrganizer" field.
  DocumentReference? _eventOrganizer;
  DocumentReference? get eventOrganizer => _eventOrganizer;
  bool hasEventOrganizer() => _eventOrganizer != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "LikedUser" field.
  List<DocumentReference>? _likedUser;
  List<DocumentReference> get likedUser => _likedUser ?? const [];
  bool hasLikedUser() => _likedUser != null;

  // "EventUpload" field.
  String? _eventUpload;
  String get eventUpload => _eventUpload ?? '';
  bool hasEventUpload() => _eventUpload != null;

  // "Comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "showComments" field.
  bool? _showComments;
  bool get showComments => _showComments ?? false;
  bool hasShowComments() => _showComments != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventName = snapshotData['EventName'] as String?;
    _eventPoster = getDataList(snapshotData['EventPoster']);
    _eventDate = snapshotData['EventDate'] as String?;
    _schoolEvent = snapshotData['SchoolEvent'] as DocumentReference?;
    _otherSchools = getDataList(snapshotData['OtherSchools']);
    _eventOrganizer = snapshotData['EventOrganizer'] as DocumentReference?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _content = snapshotData['Content'] as String?;
    _likes = castToType<int>(snapshotData['Likes']);
    _likedUser = getDataList(snapshotData['LikedUser']);
    _eventUpload = snapshotData['EventUpload'] as String?;
    _comments = getDataList(snapshotData['Comments']);
    _showComments = snapshotData['showComments'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SchoolEvents')
          : FirebaseFirestore.instance.collectionGroup('SchoolEvents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SchoolEvents').doc(id);

  static Stream<SchoolEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolEventsRecord.fromSnapshot(s));

  static Future<SchoolEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolEventsRecord.fromSnapshot(s));

  static SchoolEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolEventsRecordData({
  String? eventName,
  String? eventDate,
  DocumentReference? schoolEvent,
  DocumentReference? eventOrganizer,
  DateTime? createdAt,
  String? content,
  int? likes,
  String? eventUpload,
  bool? showComments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'EventName': eventName,
      'EventDate': eventDate,
      'SchoolEvent': schoolEvent,
      'EventOrganizer': eventOrganizer,
      'Created_at': createdAt,
      'Content': content,
      'Likes': likes,
      'EventUpload': eventUpload,
      'showComments': showComments,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolEventsRecordDocumentEquality
    implements Equality<SchoolEventsRecord> {
  const SchoolEventsRecordDocumentEquality();

  @override
  bool equals(SchoolEventsRecord? e1, SchoolEventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventName == e2?.eventName &&
        listEquality.equals(e1?.eventPoster, e2?.eventPoster) &&
        e1?.eventDate == e2?.eventDate &&
        e1?.schoolEvent == e2?.schoolEvent &&
        listEquality.equals(e1?.otherSchools, e2?.otherSchools) &&
        e1?.eventOrganizer == e2?.eventOrganizer &&
        e1?.createdAt == e2?.createdAt &&
        e1?.content == e2?.content &&
        e1?.likes == e2?.likes &&
        listEquality.equals(e1?.likedUser, e2?.likedUser) &&
        e1?.eventUpload == e2?.eventUpload &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.showComments == e2?.showComments;
  }

  @override
  int hash(SchoolEventsRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.eventPoster,
        e?.eventDate,
        e?.schoolEvent,
        e?.otherSchools,
        e?.eventOrganizer,
        e?.createdAt,
        e?.content,
        e?.likes,
        e?.likedUser,
        e?.eventUpload,
        e?.comments,
        e?.showComments
      ]);

  @override
  bool isValidKey(Object? o) => o is SchoolEventsRecord;
}
