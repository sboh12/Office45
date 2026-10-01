import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BroadcastRecord extends FirestoreRecord {
  BroadcastRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "islive" field.
  bool? _islive;
  bool get islive => _islive ?? false;
  bool hasIslive() => _islive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _islive = snapshotData['islive'] as bool?;
    _name = snapshotData['name'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('broadcast');

  static Stream<BroadcastRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadcastRecord.fromSnapshot(s));

  static Future<BroadcastRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BroadcastRecord.fromSnapshot(s));

  static BroadcastRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadcastRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadcastRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadcastRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadcastRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadcastRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadcastRecordData({
  bool? islive,
  String? name,
  DateTime? time,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'islive': islive,
      'name': name,
      'time': time,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadcastRecordDocumentEquality implements Equality<BroadcastRecord> {
  const BroadcastRecordDocumentEquality();

  @override
  bool equals(BroadcastRecord? e1, BroadcastRecord? e2) {
    return e1?.islive == e2?.islive &&
        e1?.name == e2?.name &&
        e1?.time == e2?.time &&
        e1?.url == e2?.url;
  }

  @override
  int hash(BroadcastRecord? e) =>
      const ListEquality().hash([e?.islive, e?.name, e?.time, e?.url]);

  @override
  bool isValidKey(Object? o) => o is BroadcastRecord;
}
