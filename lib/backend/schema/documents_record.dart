import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentsRecord extends FirestoreRecord {
  DocumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "DocumentTitle" field.
  String? _documentTitle;
  String get documentTitle => _documentTitle ?? '';
  bool hasDocumentTitle() => _documentTitle != null;

  // "DocumentFile" field.
  String? _documentFile;
  String get documentFile => _documentFile ?? '';
  bool hasDocumentFile() => _documentFile != null;

  // "DocumentSubject" field.
  DocumentReference? _documentSubject;
  DocumentReference? get documentSubject => _documentSubject;
  bool hasDocumentSubject() => _documentSubject != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "DocumentSchool" field.
  DocumentReference? _documentSchool;
  DocumentReference? get documentSchool => _documentSchool;
  bool hasDocumentSchool() => _documentSchool != null;

  // "DocumentDescription" field.
  String? _documentDescription;
  String get documentDescription => _documentDescription ?? '';
  bool hasDocumentDescription() => _documentDescription != null;

  // "DocumentType" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  bool hasDocumentType() => _documentType != null;

  void _initializeFields() {
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _documentTitle = snapshotData['DocumentTitle'] as String?;
    _documentFile = snapshotData['DocumentFile'] as String?;
    _documentSubject = snapshotData['DocumentSubject'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _documentSchool = snapshotData['DocumentSchool'] as DocumentReference?;
    _documentDescription = snapshotData['DocumentDescription'] as String?;
    _documentType = snapshotData['DocumentType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Documents');

  static Stream<DocumentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentsRecord.fromSnapshot(s));

  static Future<DocumentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentsRecord.fromSnapshot(s));

  static DocumentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentsRecordData({
  DocumentReference? teacher,
  String? documentTitle,
  String? documentFile,
  DocumentReference? documentSubject,
  DateTime? createdAt,
  DocumentReference? documentSchool,
  String? documentDescription,
  String? documentType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher': teacher,
      'DocumentTitle': documentTitle,
      'DocumentFile': documentFile,
      'DocumentSubject': documentSubject,
      'created_at': createdAt,
      'DocumentSchool': documentSchool,
      'DocumentDescription': documentDescription,
      'DocumentType': documentType,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentsRecordDocumentEquality implements Equality<DocumentsRecord> {
  const DocumentsRecordDocumentEquality();

  @override
  bool equals(DocumentsRecord? e1, DocumentsRecord? e2) {
    return e1?.teacher == e2?.teacher &&
        e1?.documentTitle == e2?.documentTitle &&
        e1?.documentFile == e2?.documentFile &&
        e1?.documentSubject == e2?.documentSubject &&
        e1?.createdAt == e2?.createdAt &&
        e1?.documentSchool == e2?.documentSchool &&
        e1?.documentDescription == e2?.documentDescription &&
        e1?.documentType == e2?.documentType;
  }

  @override
  int hash(DocumentsRecord? e) => const ListEquality().hash([
        e?.teacher,
        e?.documentTitle,
        e?.documentFile,
        e?.documentSubject,
        e?.createdAt,
        e?.documentSchool,
        e?.documentDescription,
        e?.documentType
      ]);

  @override
  bool isValidKey(Object? o) => o is DocumentsRecord;
}
