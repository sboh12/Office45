import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "usernameWp" field.
  String? _usernameWp;
  String get usernameWp => _usernameWp ?? '';
  bool hasUsernameWp() => _usernameWp != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "Level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "Principal" field.
  bool? _principal;
  bool get principal => _principal ?? false;
  bool hasPrincipal() => _principal != null;

  // "Teacher" field.
  bool? _teacher;
  bool get teacher => _teacher ?? false;
  bool hasTeacher() => _teacher != null;

  // "SubjectRegistered" field.
  List<DocumentReference>? _subjectRegistered;
  List<DocumentReference> get subjectRegistered =>
      _subjectRegistered ?? const [];
  bool hasSubjectRegistered() => _subjectRegistered != null;

  // "SubjectsEducating" field.
  List<DocumentReference>? _subjectsEducating;
  List<DocumentReference> get subjectsEducating =>
      _subjectsEducating ?? const [];
  bool hasSubjectsEducating() => _subjectsEducating != null;

  // "Average" field.
  double? _average;
  double get average => _average ?? 0.0;
  bool hasAverage() => _average != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Online" field.
  bool? _online;
  bool get online => _online ?? false;
  bool hasOnline() => _online != null;

  // "IdNumber" field.
  String? _idNumber;
  String get idNumber => _idNumber ?? '';
  bool hasIdNumber() => _idNumber != null;

  // "IdFile" field.
  String? _idFile;
  String get idFile => _idFile ?? '';
  bool hasIdFile() => _idFile != null;

  // "ProofResidence" field.
  String? _proofResidence;
  String get proofResidence => _proofResidence ?? '';
  bool hasProofResidence() => _proofResidence != null;

  // "DateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "Admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "SchoolEmail" field.
  String? _schoolEmail;
  String get schoolEmail => _schoolEmail ?? '';
  bool hasSchoolEmail() => _schoolEmail != null;

  // "SchoolPrincipal" field.
  DocumentReference? _schoolPrincipal;
  DocumentReference? get schoolPrincipal => _schoolPrincipal;
  bool hasSchoolPrincipal() => _schoolPrincipal != null;

  // "schoolRegistered" field.
  DocumentReference? _schoolRegistered;
  DocumentReference? get schoolRegistered => _schoolRegistered;
  bool hasSchoolRegistered() => _schoolRegistered != null;

  // "subjectLeader" field.
  DocumentReference? _subjectLeader;
  DocumentReference? get subjectLeader => _subjectLeader;
  bool hasSubjectLeader() => _subjectLeader != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _usernameWp = snapshotData['usernameWp'] as String?;
    _fullName = snapshotData['FullName'] as String?;
    _bio = snapshotData['bio'] as String?;
    _level = snapshotData['Level'] as String?;
    _gender = snapshotData['Gender'] as String?;
    _principal = snapshotData['Principal'] as bool?;
    _teacher = snapshotData['Teacher'] as bool?;
    _subjectRegistered = getDataList(snapshotData['SubjectRegistered']);
    _subjectsEducating = getDataList(snapshotData['SubjectsEducating']);
    _average = castToType<double>(snapshotData['Average']);
    _address = snapshotData['Address'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _online = snapshotData['Online'] as bool?;
    _idNumber = snapshotData['IdNumber'] as String?;
    _idFile = snapshotData['IdFile'] as String?;
    _proofResidence = snapshotData['ProofResidence'] as String?;
    _dateOfBirth = snapshotData['DateOfBirth'] as DateTime?;
    _admin = snapshotData['Admin'] as bool?;
    _schoolEmail = snapshotData['SchoolEmail'] as String?;
    _schoolPrincipal = snapshotData['SchoolPrincipal'] as DocumentReference?;
    _schoolRegistered = snapshotData['schoolRegistered'] as DocumentReference?;
    _subjectLeader = snapshotData['subjectLeader'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? usernameWp,
  String? fullName,
  String? bio,
  String? level,
  String? gender,
  bool? principal,
  bool? teacher,
  double? average,
  String? address,
  LatLng? location,
  bool? online,
  String? idNumber,
  String? idFile,
  String? proofResidence,
  DateTime? dateOfBirth,
  bool? admin,
  String? schoolEmail,
  DocumentReference? schoolPrincipal,
  DocumentReference? schoolRegistered,
  DocumentReference? subjectLeader,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'usernameWp': usernameWp,
      'FullName': fullName,
      'bio': bio,
      'Level': level,
      'Gender': gender,
      'Principal': principal,
      'Teacher': teacher,
      'Average': average,
      'Address': address,
      'Location': location,
      'Online': online,
      'IdNumber': idNumber,
      'IdFile': idFile,
      'ProofResidence': proofResidence,
      'DateOfBirth': dateOfBirth,
      'Admin': admin,
      'SchoolEmail': schoolEmail,
      'SchoolPrincipal': schoolPrincipal,
      'schoolRegistered': schoolRegistered,
      'subjectLeader': subjectLeader,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.usernameWp == e2?.usernameWp &&
        e1?.fullName == e2?.fullName &&
        e1?.bio == e2?.bio &&
        e1?.level == e2?.level &&
        e1?.gender == e2?.gender &&
        e1?.principal == e2?.principal &&
        e1?.teacher == e2?.teacher &&
        listEquality.equals(e1?.subjectRegistered, e2?.subjectRegistered) &&
        listEquality.equals(e1?.subjectsEducating, e2?.subjectsEducating) &&
        e1?.average == e2?.average &&
        e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.online == e2?.online &&
        e1?.idNumber == e2?.idNumber &&
        e1?.idFile == e2?.idFile &&
        e1?.proofResidence == e2?.proofResidence &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.admin == e2?.admin &&
        e1?.schoolEmail == e2?.schoolEmail &&
        e1?.schoolPrincipal == e2?.schoolPrincipal &&
        e1?.schoolRegistered == e2?.schoolRegistered &&
        e1?.subjectLeader == e2?.subjectLeader;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.usernameWp,
        e?.fullName,
        e?.bio,
        e?.level,
        e?.gender,
        e?.principal,
        e?.teacher,
        e?.subjectRegistered,
        e?.subjectsEducating,
        e?.average,
        e?.address,
        e?.location,
        e?.online,
        e?.idNumber,
        e?.idFile,
        e?.proofResidence,
        e?.dateOfBirth,
        e?.admin,
        e?.schoolEmail,
        e?.schoolPrincipal,
        e?.schoolRegistered,
        e?.subjectLeader
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
