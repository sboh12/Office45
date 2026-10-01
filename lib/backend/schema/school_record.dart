import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolRecord extends FirestoreRecord {
  SchoolRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "quantile" field.
  int? _quantile;
  int get quantile => _quantile ?? 0;
  bool hasQuantile() => _quantile != null;

  // "school_type" field.
  String? _schoolType;
  String get schoolType => _schoolType ?? '';
  bool hasSchoolType() => _schoolType != null;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  bool hasProvince() => _province != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "code_of_conduct" field.
  String? _codeOfConduct;
  String get codeOfConduct => _codeOfConduct ?? '';
  bool hasCodeOfConduct() => _codeOfConduct != null;

  // "Performance" field.
  List<double>? _performance;
  List<double> get performance => _performance ?? const [];
  bool hasPerformance() => _performance != null;

  // "ExtraCurricular" field.
  String? _extraCurricular;
  String get extraCurricular => _extraCurricular ?? '';
  bool hasExtraCurricular() => _extraCurricular != null;

  // "schoolTel" field.
  String? _schoolTel;
  String get schoolTel => _schoolTel ?? '';
  bool hasSchoolTel() => _schoolTel != null;

  // "Enrollment" field.
  int? _enrollment;
  int get enrollment => _enrollment ?? 0;
  bool hasEnrollment() => _enrollment != null;

  // "MaxSpaces" field.
  int? _maxSpaces;
  int get maxSpaces => _maxSpaces ?? 0;
  bool hasMaxSpaces() => _maxSpaces != null;

  // "SchoolPrincipal" field.
  DocumentReference? _schoolPrincipal;
  DocumentReference? get schoolPrincipal => _schoolPrincipal;
  bool hasSchoolPrincipal() => _schoolPrincipal != null;

  // "SchoolStudents" field.
  List<DocumentReference>? _schoolStudents;
  List<DocumentReference> get schoolStudents => _schoolStudents ?? const [];
  bool hasSchoolStudents() => _schoolStudents != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "schoolCode" field.
  String? _schoolCode;
  String get schoolCode => _schoolCode ?? '';
  bool hasSchoolCode() => _schoolCode != null;

  // "schoolApplications" field.
  List<DocumentReference>? _schoolApplications;
  List<DocumentReference> get schoolApplications =>
      _schoolApplications ?? const [];
  bool hasSchoolApplications() => _schoolApplications != null;

  // "schoolDistrict" field.
  String? _schoolDistrict;
  String get schoolDistrict => _schoolDistrict ?? '';
  bool hasSchoolDistrict() => _schoolDistrict != null;

  // "schoolCMC" field.
  String? _schoolCMC;
  String get schoolCMC => _schoolCMC ?? '';
  bool hasSchoolCMC() => _schoolCMC != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _email = snapshotData['email'] as String?;
    _image = snapshotData['image'] as String?;
    _quantile = castToType<int>(snapshotData['quantile']);
    _schoolType = snapshotData['school_type'] as String?;
    _province = snapshotData['province'] as String?;
    _city = snapshotData['city'] as String?;
    _codeOfConduct = snapshotData['code_of_conduct'] as String?;
    _performance = getDataList(snapshotData['Performance']);
    _extraCurricular = snapshotData['ExtraCurricular'] as String?;
    _schoolTel = snapshotData['schoolTel'] as String?;
    _enrollment = castToType<int>(snapshotData['Enrollment']);
    _maxSpaces = castToType<int>(snapshotData['MaxSpaces']);
    _schoolPrincipal = snapshotData['SchoolPrincipal'] as DocumentReference?;
    _schoolStudents = getDataList(snapshotData['SchoolStudents']);
    _description = snapshotData['Description'] as String?;
    _address = snapshotData['Address'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _followers = getDataList(snapshotData['Followers']);
    _schoolCode = snapshotData['schoolCode'] as String?;
    _schoolApplications = getDataList(snapshotData['schoolApplications']);
    _schoolDistrict = snapshotData['schoolDistrict'] as String?;
    _schoolCMC = snapshotData['schoolCMC'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('School');

  static Stream<SchoolRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolRecord.fromSnapshot(s));

  static Future<SchoolRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolRecord.fromSnapshot(s));

  static SchoolRecord fromSnapshot(DocumentSnapshot snapshot) => SchoolRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolRecordData({
  String? name,
  LatLng? location,
  String? phoneNumber,
  String? email,
  String? image,
  int? quantile,
  String? schoolType,
  String? province,
  String? city,
  String? codeOfConduct,
  String? extraCurricular,
  String? schoolTel,
  int? enrollment,
  int? maxSpaces,
  DocumentReference? schoolPrincipal,
  String? description,
  String? address,
  DateTime? createdAt,
  String? schoolCode,
  String? schoolDistrict,
  String? schoolCMC,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'phone_number': phoneNumber,
      'email': email,
      'image': image,
      'quantile': quantile,
      'school_type': schoolType,
      'province': province,
      'city': city,
      'code_of_conduct': codeOfConduct,
      'ExtraCurricular': extraCurricular,
      'schoolTel': schoolTel,
      'Enrollment': enrollment,
      'MaxSpaces': maxSpaces,
      'SchoolPrincipal': schoolPrincipal,
      'Description': description,
      'Address': address,
      'created_at': createdAt,
      'schoolCode': schoolCode,
      'schoolDistrict': schoolDistrict,
      'schoolCMC': schoolCMC,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolRecordDocumentEquality implements Equality<SchoolRecord> {
  const SchoolRecordDocumentEquality();

  @override
  bool equals(SchoolRecord? e1, SchoolRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.image == e2?.image &&
        e1?.quantile == e2?.quantile &&
        e1?.schoolType == e2?.schoolType &&
        e1?.province == e2?.province &&
        e1?.city == e2?.city &&
        e1?.codeOfConduct == e2?.codeOfConduct &&
        listEquality.equals(e1?.performance, e2?.performance) &&
        e1?.extraCurricular == e2?.extraCurricular &&
        e1?.schoolTel == e2?.schoolTel &&
        e1?.enrollment == e2?.enrollment &&
        e1?.maxSpaces == e2?.maxSpaces &&
        e1?.schoolPrincipal == e2?.schoolPrincipal &&
        listEquality.equals(e1?.schoolStudents, e2?.schoolStudents) &&
        e1?.description == e2?.description &&
        e1?.address == e2?.address &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.schoolCode == e2?.schoolCode &&
        listEquality.equals(e1?.schoolApplications, e2?.schoolApplications) &&
        e1?.schoolDistrict == e2?.schoolDistrict &&
        e1?.schoolCMC == e2?.schoolCMC;
  }

  @override
  int hash(SchoolRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.phoneNumber,
        e?.email,
        e?.image,
        e?.quantile,
        e?.schoolType,
        e?.province,
        e?.city,
        e?.codeOfConduct,
        e?.performance,
        e?.extraCurricular,
        e?.schoolTel,
        e?.enrollment,
        e?.maxSpaces,
        e?.schoolPrincipal,
        e?.schoolStudents,
        e?.description,
        e?.address,
        e?.createdAt,
        e?.followers,
        e?.schoolCode,
        e?.schoolApplications,
        e?.schoolDistrict,
        e?.schoolCMC
      ]);

  @override
  bool isValidKey(Object? o) => o is SchoolRecord;
}
