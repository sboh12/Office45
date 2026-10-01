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

int? averageListString(List<String>? lis) {
  // average of a list given as a string
  if (lis == null || lis.isEmpty) {
    return 0;
  }
  final list = lis
      .map(int.tryParse)
      .where((element) => element != null)
      .map((e) => e!)
      .toList();
  if (list.isEmpty) {
    return 0;
  }
  final sum = list.reduce((value, element) => value + element);
  return (sum / list.length).round();
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

bool? isYoutubeLink(String? inputText) {
  // check if input text is a link
  if (inputText == null) return null;

  // regular expression to match a URL
  RegExp urlRegex = RegExp(
      r"(http://|https://)?(www\.)?[a-zA-Z0-9]+\.[a-zA-Z]+(\.[a-zA-Z]+)?(/[a-zA-Z0-9#]+)*(\?[a-zA-Z0-9_]+=[a-zA-Z0-9_]+(&[a-zA-Z0-9_]+=[a-zA-Z0-9_]+)*)?");

  return urlRegex.hasMatch(inputText);
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

bool? isLink(String? inputText) {
  // check if input text is a link
  if (inputText == null) return null;

  // regular expression to match a URL
  RegExp urlRegex = RegExp(
      r"(http://|https://)?(www\.)?[a-zA-Z0-9]+\.[a-zA-Z]+(\.[a-zA-Z]+)?(/[a-zA-Z0-9#]+)*(\?[a-zA-Z0-9_]+=[a-zA-Z0-9_]+(&[a-zA-Z0-9_]+=[a-zA-Z0-9_]+)*)?");

  return urlRegex.hasMatch(inputText);
}

int? getStringLength(String? str) {
  // get string length
  if (str == null) {
    return null;
  } else {
    return str.length;
  }
}

String? replaceSpecialChar(String? inputText) {
  if (inputText == null)
    return null;
  else {
    inputText = inputText.replaceAll(RegExp(r'[^\w\s]+'), ' ');
    inputText = inputText.replaceAll(RegExp(r'"'), ' ');
    inputText = inputText.replaceAll(RegExp(r'*'), ' ');
    inputText = inputText.replaceAll(RegExp(r'\n'), ' ');
    return inputText;
  }
}

int? stringToInt(String? valueString) {
  // string to integer
  if (valueString == null) {
    return 0;
  }
  try {
    return int.parse(valueString);
  } catch (e) {
    return 0;
  }
}

dynamic dynamicArrayTojson(List<String> dynamicArray) {
  // dynamic Array To json
  return jsonEncode(dynamicArray);
}

String? twickPicImagePath(
  String? imageFile,
  String? params,
) {
  // code to replace imagepath string that starts with https://firebasestorage.googleapis.com/v0/b/truechat-678cc.appspot.com/o/ to start with https://office45.twic.pics/
  if (imageFile == null || imageFile.isEmpty) {
    return '';
  }
  String newPath = imageFile.replaceFirst(
      'https://firebasestorage.googleapis.com/v0/b/truechat-678cc.appspot.com/o/',
      'https://office45.twic.pics/');

  if (params == null) {
    params = '';
  }
  return newPath + params;
}

String getPlaybackIdFromUrl(String url) {
  String str1 = url.replaceAll(".m3u8", "");
  return str1.split("/").last;
}

String createUrlFromPlaybackId(String playbackId) {
  return 'https://stream.mux.com/$playbackId.m3u8';
}
