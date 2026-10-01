import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassrateRecord extends FirestoreRecord {
  PassrateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "percent" field.
  int? _percent;
  int get percent => _percent ?? 0;
  bool hasPercent() => _percent != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "term" field.
  int? _term;
  int get term => _term ?? 0;
  bool hasTerm() => _term != null;

  // "addby" field.
  DocumentReference? _addby;
  DocumentReference? get addby => _addby;
  bool hasAddby() => _addby != null;

  // "curriculum" field.
  List<DocumentReference>? _curriculum;
  List<DocumentReference> get curriculum => _curriculum ?? const [];
  bool hasCurriculum() => _curriculum != null;

  // "absent" field.
  int? _absent;
  int get absent => _absent ?? 0;
  bool hasAbsent() => _absent != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _percent = castToType<int>(snapshotData['percent']);
    _year = castToType<int>(snapshotData['year']);
    _term = castToType<int>(snapshotData['term']);
    _addby = snapshotData['addby'] as DocumentReference?;
    _curriculum = getDataList(snapshotData['curriculum']);
    _absent = castToType<int>(snapshotData['absent']);
    _comments = snapshotData['comments'] as String?;
    _level = snapshotData['level'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Passrate')
          : FirebaseFirestore.instance.collectionGroup('Passrate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Passrate').doc(id);

  static Stream<PassrateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassrateRecord.fromSnapshot(s));

  static Future<PassrateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassrateRecord.fromSnapshot(s));

  static PassrateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassrateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassrateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassrateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PassrateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PassrateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPassrateRecordData({
  DateTime? createdAt,
  int? percent,
  int? year,
  int? term,
  DocumentReference? addby,
  int? absent,
  String? comments,
  String? level,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'percent': percent,
      'year': year,
      'term': term,
      'addby': addby,
      'absent': absent,
      'comments': comments,
      'level': level,
    }.withoutNulls,
  );

  return firestoreData;
}

class PassrateRecordDocumentEquality implements Equality<PassrateRecord> {
  const PassrateRecordDocumentEquality();

  @override
  bool equals(PassrateRecord? e1, PassrateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.percent == e2?.percent &&
        e1?.year == e2?.year &&
        e1?.term == e2?.term &&
        e1?.addby == e2?.addby &&
        listEquality.equals(e1?.curriculum, e2?.curriculum) &&
        e1?.absent == e2?.absent &&
        e1?.comments == e2?.comments &&
        e1?.level == e2?.level;
  }

  @override
  int hash(PassrateRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.percent,
        e?.year,
        e?.term,
        e?.addby,
        e?.curriculum,
        e?.absent,
        e?.comments,
        e?.level
      ]);

  @override
  bool isValidKey(Object? o) => o is PassrateRecord;
}
