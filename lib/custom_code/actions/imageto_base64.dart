// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String?> imagetoBase64(String? imageUrl) async {
  // image url to base64
  if (imageUrl == null) {
    return null;
  }

  try {
    final response = await http.get(Uri.parse(imageUrl));
    final bytes = response.bodyBytes;
    final base64Image = base64Encode(bytes);
    return base64Image;
  } catch (e) {
    print(e);
    return null;
  }
}
