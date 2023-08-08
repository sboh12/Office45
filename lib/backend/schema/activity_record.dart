import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "ContentFile" field.
  List<String>? _contentFile;
  List<String> get contentFile => _contentFile ?? const [];
  bool hasContentFile() => _contentFile != null;

  // "MaxMark" field.
  int? _maxMark;
  int get maxMark => _maxMark ?? 0;
  bool hasMaxMark() => _maxMark != null;

  // "DueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "ActivityType" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  bool hasActivityType() => _activityType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _content = snapshotData['Content'] as String?;
    _contentFile = getDataList(snapshotData['ContentFile']);
    _maxMark = castToType<int>(snapshotData['MaxMark']);
    _dueDate = snapshotData['DueDate'] as DateTime?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _activityType = snapshotData['ActivityType'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Activity')
          : FirebaseFirestore.instance.collectionGroup('Activity');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Activity').doc();

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  String? name,
  String? content,
  int? maxMark,
  DateTime? dueDate,
  DateTime? createdAt,
  String? activityType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Content': content,
      'MaxMark': maxMark,
      'DueDate': dueDate,
      'Created_at': createdAt,
      'ActivityType': activityType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityRecordDocumentEquality implements Equality<ActivityRecord> {
  const ActivityRecordDocumentEquality();

  @override
  bool equals(ActivityRecord? e1, ActivityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.content == e2?.content &&
        listEquality.equals(e1?.contentFile, e2?.contentFile) &&
        e1?.maxMark == e2?.maxMark &&
        e1?.dueDate == e2?.dueDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.activityType == e2?.activityType;
  }

  @override
  int hash(ActivityRecord? e) => const ListEquality().hash([
        e?.name,
        e?.content,
        e?.contentFile,
        e?.maxMark,
        e?.dueDate,
        e?.createdAt,
        e?.activityType
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivityRecord;
}
