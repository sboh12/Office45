import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ratedTeacher" field.
  DocumentReference? _ratedTeacher;
  DocumentReference? get ratedTeacher => _ratedTeacher;
  bool hasRatedTeacher() => _ratedTeacher != null;

  // "stars" field.
  int? _stars;
  int get stars => _stars ?? 0;
  bool hasStars() => _stars != null;

  // "ratingfrom" field.
  DocumentReference? _ratingfrom;
  DocumentReference? get ratingfrom => _ratingfrom;
  bool hasRatingfrom() => _ratingfrom != null;

  // "Comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ratedTeacher = snapshotData['ratedTeacher'] as DocumentReference?;
    _stars = castToType<int>(snapshotData['stars']);
    _ratingfrom = snapshotData['ratingfrom'] as DocumentReference?;
    _comments = snapshotData['Comments'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Ratings')
          : FirebaseFirestore.instance.collectionGroup('Ratings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Ratings').doc();

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  DocumentReference? ratedTeacher,
  int? stars,
  DocumentReference? ratingfrom,
  String? comments,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ratedTeacher': ratedTeacher,
      'stars': stars,
      'ratingfrom': ratingfrom,
      'Comments': comments,
      'Created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.ratedTeacher == e2?.ratedTeacher &&
        e1?.stars == e2?.stars &&
        e1?.ratingfrom == e2?.ratingfrom &&
        e1?.comments == e2?.comments &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality().hash(
      [e?.ratedTeacher, e?.stars, e?.ratingfrom, e?.comments, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
