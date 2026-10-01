import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _loopApplication = prefs.getInt('ff_loopApplication') ?? _loopApplication;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String _SubjectId = '';
  String get SubjectId => _SubjectId;
  set SubjectId(String value) {
    _SubjectId = value;
  }

  dynamic _SubjectData;
  dynamic get SubjectData => _SubjectData;
  set SubjectData(dynamic value) {
    _SubjectData = value;
  }

  String _uploadedAssignmentURL = '';
  String get uploadedAssignmentURL => _uploadedAssignmentURL;
  set uploadedAssignmentURL(String value) {
    _uploadedAssignmentURL = value;
  }

  bool _openList = false;
  bool get openList => _openList;
  set openList(bool value) {
    _openList = value;
  }

  bool _openAddStudents = false;
  bool get openAddStudents => _openAddStudents;
  set openAddStudents(bool value) {
    _openAddStudents = value;
  }

  bool _openLevel = false;
  bool get openLevel => _openLevel;
  set openLevel(bool value) {
    _openLevel = value;
  }

  List<int> _days = [];
  List<int> get days => _days;
  set days(List<int> value) {
    _days = value;
  }

  void addToDays(int value) {
    days.add(value);
  }

  void removeFromDays(int value) {
    days.remove(value);
  }

  void removeAtIndexFromDays(int index) {
    days.removeAt(index);
  }

  void updateDaysAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    days[index] = updateFn(_days[index]);
  }

  void insertAtIndexInDays(int index, int value) {
    days.insert(index, value);
  }

  int _CountGraph = 0;
  int get CountGraph => _CountGraph;
  set CountGraph(int value) {
    _CountGraph = value;
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
  set Seven(List<int> value) {
    _Seven = value;
  }

  void addToSeven(int value) {
    Seven.add(value);
  }

  void removeFromSeven(int value) {
    Seven.remove(value);
  }

  void removeAtIndexFromSeven(int index) {
    Seven.removeAt(index);
  }

  void updateSevenAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    Seven[index] = updateFn(_Seven[index]);
  }

  void insertAtIndexInSeven(int index, int value) {
    Seven.insert(index, value);
  }

  List<int> _usersPerDay = [];
  List<int> get usersPerDay => _usersPerDay;
  set usersPerDay(List<int> value) {
    _usersPerDay = value;
  }

  void addToUsersPerDay(int value) {
    usersPerDay.add(value);
  }

  void removeFromUsersPerDay(int value) {
    usersPerDay.remove(value);
  }

  void removeAtIndexFromUsersPerDay(int index) {
    usersPerDay.removeAt(index);
  }

  void updateUsersPerDayAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    usersPerDay[index] = updateFn(_usersPerDay[index]);
  }

  void insertAtIndexInUsersPerDay(int index, int value) {
    usersPerDay.insert(index, value);
  }

  List<int> _eventGraph = [];
  List<int> get eventGraph => _eventGraph;
  set eventGraph(List<int> value) {
    _eventGraph = value;
  }

  void addToEventGraph(int value) {
    eventGraph.add(value);
  }

  void removeFromEventGraph(int value) {
    eventGraph.remove(value);
  }

  void removeAtIndexFromEventGraph(int index) {
    eventGraph.removeAt(index);
  }

  void updateEventGraphAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    eventGraph[index] = updateFn(_eventGraph[index]);
  }

  void insertAtIndexInEventGraph(int index, int value) {
    eventGraph.insert(index, value);
  }

  int _subjectUsers = 0;
  int get subjectUsers => _subjectUsers;
  set subjectUsers(int value) {
    _subjectUsers = value;
  }

  int _deleteVar = 0;
  int get deleteVar => _deleteVar;
  set deleteVar(int value) {
    _deleteVar = value;
  }

  DocumentReference? _selectedUser;
  DocumentReference? get selectedUser => _selectedUser;
  set selectedUser(DocumentReference? value) {
    _selectedUser = value;
  }

  List<DocumentReference> _uploadedNotes = [];
  List<DocumentReference> get uploadedNotes => _uploadedNotes;
  set uploadedNotes(List<DocumentReference> value) {
    _uploadedNotes = value;
  }

  void addToUploadedNotes(DocumentReference value) {
    uploadedNotes.add(value);
  }

  void removeFromUploadedNotes(DocumentReference value) {
    uploadedNotes.remove(value);
  }

  void removeAtIndexFromUploadedNotes(int index) {
    uploadedNotes.removeAt(index);
  }

  void updateUploadedNotesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    uploadedNotes[index] = updateFn(_uploadedNotes[index]);
  }

  void insertAtIndexInUploadedNotes(int index, DocumentReference value) {
    uploadedNotes.insert(index, value);
  }

  bool _more = false;
  bool get more => _more;
  set more(bool value) {
    _more = value;
  }

  bool _openImage = false;
  bool get openImage => _openImage;
  set openImage(bool value) {
    _openImage = value;
  }

  bool _openPdf = false;
  bool get openPdf => _openPdf;
  set openPdf(bool value) {
    _openPdf = value;
  }

  List<DocumentReference> _subjectsS = [];
  List<DocumentReference> get subjectsS => _subjectsS;
  set subjectsS(List<DocumentReference> value) {
    _subjectsS = value;
  }

  void addToSubjectsS(DocumentReference value) {
    subjectsS.add(value);
  }

  void removeFromSubjectsS(DocumentReference value) {
    subjectsS.remove(value);
  }

  void removeAtIndexFromSubjectsS(int index) {
    subjectsS.removeAt(index);
  }

  void updateSubjectsSAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    subjectsS[index] = updateFn(_subjectsS[index]);
  }

  void insertAtIndexInSubjectsS(int index, DocumentReference value) {
    subjectsS.insert(index, value);
  }

  List<int> _ResultAv = [];
  List<int> get ResultAv => _ResultAv;
  set ResultAv(List<int> value) {
    _ResultAv = value;
  }

  void addToResultAv(int value) {
    ResultAv.add(value);
  }

  void removeFromResultAv(int value) {
    ResultAv.remove(value);
  }

  void removeAtIndexFromResultAv(int index) {
    ResultAv.removeAt(index);
  }

  void updateResultAvAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    ResultAv[index] = updateFn(_ResultAv[index]);
  }

  void insertAtIndexInResultAv(int index, int value) {
    ResultAv.insert(index, value);
  }

  List<DocumentReference> _members = [];
  List<DocumentReference> get members => _members;
  set members(List<DocumentReference> value) {
    _members = value;
  }

  void addToMembers(DocumentReference value) {
    members.add(value);
  }

  void removeFromMembers(DocumentReference value) {
    members.remove(value);
  }

  void removeAtIndexFromMembers(int index) {
    members.removeAt(index);
  }

  void updateMembersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    members[index] = updateFn(_members[index]);
  }

  void insertAtIndexInMembers(int index, DocumentReference value) {
    members.insert(index, value);
  }

  List<DocumentReference> _acti = [];
  List<DocumentReference> get acti => _acti;
  set acti(List<DocumentReference> value) {
    _acti = value;
  }

  void addToActi(DocumentReference value) {
    acti.add(value);
  }

  void removeFromActi(DocumentReference value) {
    acti.remove(value);
  }

  void removeAtIndexFromActi(int index) {
    acti.removeAt(index);
  }

  void updateActiAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    acti[index] = updateFn(_acti[index]);
  }

  void insertAtIndexInActi(int index, DocumentReference value) {
    acti.insert(index, value);
  }

  DocumentReference? _aiUser =
      FirebaseFirestore.instance.doc('/users/OLP1rjtgf1bZbO8e67artK4NN143');
  DocumentReference? get aiUser => _aiUser;
  set aiUser(DocumentReference? value) {
    _aiUser = value;
  }

  String _messages = '';
  String get messages => _messages;
  set messages(String value) {
    _messages = value;
  }

  String _videoFile = '';
  String get videoFile => _videoFile;
  set videoFile(String value) {
    _videoFile = value;
  }

  int _loopApplication = 0;
  int get loopApplication => _loopApplication;
  set loopApplication(int value) {
    _loopApplication = value;
    prefs.setInt('ff_loopApplication', value);
  }

  bool _readMore = false;
  bool get readMore => _readMore;
  set readMore(bool value) {
    _readMore = value;
  }

  String _copiedPDF = '';
  String get copiedPDF => _copiedPDF;
  set copiedPDF(String value) {
    _copiedPDF = value;
  }

  int _subjectsPassed = 0;
  int get subjectsPassed => _subjectsPassed;
  set subjectsPassed(int value) {
    _subjectsPassed = value;
  }

  bool _showVidButton = true;
  bool get showVidButton => _showVidButton;
  set showVidButton(bool value) {
    _showVidButton = value;
  }

  DocumentReference? _passRates;
  DocumentReference? get passRates => _passRates;
  set passRates(DocumentReference? value) {
    _passRates = value;
  }

  List<int> _grade = [];
  List<int> get grade => _grade;
  set grade(List<int> value) {
    _grade = value;
  }

  void addToGrade(int value) {
    grade.add(value);
  }

  void removeFromGrade(int value) {
    grade.remove(value);
  }

  void removeAtIndexFromGrade(int index) {
    grade.removeAt(index);
  }

  void updateGradeAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    grade[index] = updateFn(_grade[index]);
  }

  void insertAtIndexInGrade(int index, int value) {
    grade.insert(index, value);
  }
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
