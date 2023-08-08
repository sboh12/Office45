import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? filePDFType(String? url) {
  // check if url is an image
  if (url == null) return null;
  if (url.contains('.pdf')) {
    return true;
  } else {
    return false;
  }
}

bool? fileImageType(String? url) {
  // check if url is an image
  if (url == null) return null;
  if (url.contains('.jpg') || url.contains('.jpeg') || url.contains('.png')) {
    return true;
  } else {
    return false;
  }
}

bool? checkElementExists(
  dynamic array,
  String? value,
) {
  // check if array contains element
  if (array == null || value == null) return false;
  return array.contains(value);
}

String? amOrPM(String? time) {
  // check if url is an image
  if (time == null) return null;
  if (time.contains('PM')) {
    return "Good Afternoon";
  } else {
    return "Good Morning";
  }
}

List<int>? listOfDays(DateTime? givenDays) {
  // list Of Days
  if (givenDays == null) return null;

  List<int> days = [];

  // get the number of days in the given month
  int numDays = DateTime(givenDays.year, givenDays.month + 1, 0).day;

  // add each day to the list
  for (int i = 1; i <= numDays; i++) {
    days.add(i);
  }

  return days;
}

List<DateTime>? subtractDays(int? numberOfDays) {
  // subtract days from current day
  if (numberOfDays == null) return null;

  DateTime now = DateTime.now();
  Duration duration = Duration(days: numberOfDays);
  DateTime subtractedDate = now.subtract(duration);

  return [
    DateTime(
        subtractedDate.year, subtractedDate.month, subtractedDate.day, 23, 59),
    DateTime(subtractedDate.year, subtractedDate.month, subtractedDate.day)
  ];
}

int? averageList(List<int>? lis) {
  // average of a list
  if (lis == null || lis.isEmpty) return 0;

  int sum = 0;
  for (int i = 0; i < lis.length; i++) {
    sum += lis[i];
  }

  return sum ~/ lis.length;
}

int? roundNearestInteger(double? doubleValue) {
  // rounddouble to integer
// round double to integer
  if (doubleValue == null) return 0;

  return doubleValue.round();
}
