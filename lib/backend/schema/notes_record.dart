import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NotesName" field.
  String? _notesName;
  String get notesName => _notesName ?? '';
  bool hasNotesName() => _notesName != null;

  // "NotesFile" field.
  List<String>? _notesFile;
  List<String> get notesFile => _notesFile ?? const [];
  bool hasNotesFile() => _notesFile != null;

  // "Summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "Author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "NoteImages" field.
  List<String>? _noteImages;
  List<String> get noteImages => _noteImages ?? const [];
  bool hasNoteImages() => _noteImages != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notesName = snapshotData['NotesName'] as String?;
    _notesFile = getDataList(snapshotData['NotesFile']);
    _summary = snapshotData['Summary'] as String?;
    _author = snapshotData['Author'] as DocumentReference?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _noteImages = getDataList(snapshotData['NoteImages']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Notes')
          : FirebaseFirestore.instance.collectionGroup('Notes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Notes').doc();

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  String? notesName,
  String? summary,
  DocumentReference? author,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NotesName': notesName,
      'Summary': summary,
      'Author': author,
      'Created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notesName == e2?.notesName &&
        listEquality.equals(e1?.notesFile, e2?.notesFile) &&
        e1?.summary == e2?.summary &&
        e1?.author == e2?.author &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.noteImages, e2?.noteImages);
  }

  @override
  int hash(NotesRecord? e) => const ListEquality().hash([
        e?.notesName,
        e?.notesFile,
        e?.summary,
        e?.author,
        e?.createdAt,
        e?.noteImages
      ]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
