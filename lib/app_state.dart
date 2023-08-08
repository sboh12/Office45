import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String _value) {
    _userID = _value;
  }

  String _name = '';
  String get name => _name;
  set name(String _value) {
    _name = _value;
  }

  String _ProfileEmail = '';
  String get ProfileEmail => _ProfileEmail;
  set ProfileEmail(String _value) {
    _ProfileEmail = _value;
  }

  String _ProfileIdNumber = '';
  String get ProfileIdNumber => _ProfileIdNumber;
  set ProfileIdNumber(String _value) {
    _ProfileIdNumber = _value;
  }

  String _ProfilePhoneNumber = '';
  String get ProfilePhoneNumber => _ProfilePhoneNumber;
  set ProfilePhoneNumber(String _value) {
    _ProfilePhoneNumber = _value;
  }

  String _ProfileAddress = '';
  String get ProfileAddress => _ProfileAddress;
  set ProfileAddress(String _value) {
    _ProfileAddress = _value;
  }

  String _ProfileAverage = '';
  String get ProfileAverage => _ProfileAverage;
  set ProfileAverage(String _value) {
    _ProfileAverage = _value;
  }

  String _ProfileBio = '';
  String get ProfileBio => _ProfileBio;
  set ProfileBio(String _value) {
    _ProfileBio = _value;
  }

  String _ProfileLevel = '';
  String get ProfileLevel => _ProfileLevel;
  set ProfileLevel(String _value) {
    _ProfileLevel = _value;
  }

  String _ProfilePicture = '';
  String get ProfilePicture => _ProfilePicture;
  set ProfilePicture(String _value) {
    _ProfilePicture = _value;
  }

  String _SchoolId = '';
  String get SchoolId => _SchoolId;
  set SchoolId(String _value) {
    _SchoolId = _value;
  }

  dynamic _SchoolData;
  dynamic get SchoolData => _SchoolData;
  set SchoolData(dynamic _value) {
    _SchoolData = _value;
  }

  String _SubjectId = '';
  String get SubjectId => _SubjectId;
  set SubjectId(String _value) {
    _SubjectId = _value;
  }

  dynamic _SubjectData;
  dynamic get SubjectData => _SubjectData;
  set SubjectData(dynamic _value) {
    _SubjectData = _value;
  }

  String _uploadedAssignmentURL = '';
  String get uploadedAssignmentURL => _uploadedAssignmentURL;
  set uploadedAssignmentURL(String _value) {
    _uploadedAssignmentURL = _value;
  }

  bool _openList = false;
  bool get openList => _openList;
  set openList(bool _value) {
    _openList = _value;
  }

  bool _openAddStudents = false;
  bool get openAddStudents => _openAddStudents;
  set openAddStudents(bool _value) {
    _openAddStudents = _value;
  }

  bool _openLevel = false;
  bool get openLevel => _openLevel;
  set openLevel(bool _value) {
    _openLevel = _value;
  }

  List<int> _days = [];
  List<int> get days => _days;
  set days(List<int> _value) {
    _days = _value;
  }

  void addToDays(int _value) {
    _days.add(_value);
  }

  void removeFromDays(int _value) {
    _days.remove(_value);
  }

  void removeAtIndexFromDays(int _index) {
    _days.removeAt(_index);
  }

  void updateDaysAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _days[_index] = updateFn(_days[_index]);
  }

  int _CountGraph = 0;
  int get CountGraph => _CountGraph;
  set CountGraph(int _value) {
    _CountGraph = _value;
  }

  List<int> _Seven = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];
  List<int> get Seven => _Seven;
  set Seven(List<int> _value) {
    _Seven = _value;
  }

  void addToSeven(int _value) {
    _Seven.add(_value);
  }

  void removeFromSeven(int _value) {
    _Seven.remove(_value);
  }

  void removeAtIndexFromSeven(int _index) {
    _Seven.removeAt(_index);
  }

  void updateSevenAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _Seven[_index] = updateFn(_Seven[_index]);
  }

  List<int> _usersPerDay = [];
  List<int> get usersPerDay => _usersPerDay;
  set usersPerDay(List<int> _value) {
    _usersPerDay = _value;
  }

  void addToUsersPerDay(int _value) {
    _usersPerDay.add(_value);
  }

  void removeFromUsersPerDay(int _value) {
    _usersPerDay.remove(_value);
  }

  void removeAtIndexFromUsersPerDay(int _index) {
    _usersPerDay.removeAt(_index);
  }

  void updateUsersPerDayAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _usersPerDay[_index] = updateFn(_usersPerDay[_index]);
  }

  List<int> _eventGraph = [];
  List<int> get eventGraph => _eventGraph;
  set eventGraph(List<int> _value) {
    _eventGraph = _value;
  }

  void addToEventGraph(int _value) {
    _eventGraph.add(_value);
  }

  void removeFromEventGraph(int _value) {
    _eventGraph.remove(_value);
  }

  void removeAtIndexFromEventGraph(int _index) {
    _eventGraph.removeAt(_index);
  }

  void updateEventGraphAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _eventGraph[_index] = updateFn(_eventGraph[_index]);
  }

  int _subjectUsers = 0;
  int get subjectUsers => _subjectUsers;
  set subjectUsers(int _value) {
    _subjectUsers = _value;
  }

  int _deleteVar = 0;
  int get deleteVar => _deleteVar;
  set deleteVar(int _value) {
    _deleteVar = _value;
  }

  DocumentReference? _selectedUser;
  DocumentReference? get selectedUser => _selectedUser;
  set selectedUser(DocumentReference? _value) {
    _selectedUser = _value;
  }

  List<DocumentReference> _uploadedNotes = [];
  List<DocumentReference> get uploadedNotes => _uploadedNotes;
  set uploadedNotes(List<DocumentReference> _value) {
    _uploadedNotes = _value;
  }

  void addToUploadedNotes(DocumentReference _value) {
    _uploadedNotes.add(_value);
  }

  void removeFromUploadedNotes(DocumentReference _value) {
    _uploadedNotes.remove(_value);
  }

  void removeAtIndexFromUploadedNotes(int _index) {
    _uploadedNotes.removeAt(_index);
  }

  void updateUploadedNotesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _uploadedNotes[_index] = updateFn(_uploadedNotes[_index]);
  }

  bool _more = false;
  bool get more => _more;
  set more(bool _value) {
    _more = _value;
  }

  bool _openImage = false;
  bool get openImage => _openImage;
  set openImage(bool _value) {
    _openImage = _value;
  }

  bool _openPdf = false;
  bool get openPdf => _openPdf;
  set openPdf(bool _value) {
    _openPdf = _value;
  }

  List<DocumentReference> _subjectsS = [];
  List<DocumentReference> get subjectsS => _subjectsS;
  set subjectsS(List<DocumentReference> _value) {
    _subjectsS = _value;
  }

  void addToSubjectsS(DocumentReference _value) {
    _subjectsS.add(_value);
  }

  void removeFromSubjectsS(DocumentReference _value) {
    _subjectsS.remove(_value);
  }

  void removeAtIndexFromSubjectsS(int _index) {
    _subjectsS.removeAt(_index);
  }

  void updateSubjectsSAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _subjectsS[_index] = updateFn(_subjectsS[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
