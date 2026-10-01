import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApplicationsRecord extends FirestoreRecord {
  ApplicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "Approved" field.
  bool? _approved;
  bool get approved => _approved ?? false;
  bool hasApproved() => _approved != null;

  // "ucode" field.
  String? _ucode;
  String get ucode => _ucode ?? '';
  bool hasUcode() => _ucode != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _student = snapshotData['Student'] as DocumentReference?;
    _approved = snapshotData['Approved'] as bool?;
    _ucode = snapshotData['ucode'] as String?;
    _comment = snapshotData['comment'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Applications')
          : FirebaseFirestore.instance.collectionGroup('Applications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Applications').doc(id);

  static Stream<ApplicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApplicationsRecord.fromSnapshot(s));

  static Future<ApplicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApplicationsRecord.fromSnapshot(s));

  static ApplicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApplicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApplicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApplicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApplicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApplicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApplicationsRecordData({
  DocumentReference? student,
  bool? approved,
  String? ucode,
  String? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Student': student,
      'Approved': approved,
      'ucode': ucode,
      'comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApplicationsRecordDocumentEquality
    implements Equality<ApplicationsRecord> {
  const ApplicationsRecordDocumentEquality();

  @override
  bool equals(ApplicationsRecord? e1, ApplicationsRecord? e2) {
    return e1?.student == e2?.student &&
        e1?.approved == e2?.approved &&
        e1?.ucode == e2?.ucode &&
        e1?.comment == e2?.comment;
  }

  @override
  int hash(ApplicationsRecord? e) => const ListEquality()
      .hash([e?.student, e?.approved, e?.ucode, e?.comment]);

  @override
  bool isValidKey(Object? o) => o is ApplicationsRecord;
}
