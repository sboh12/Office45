// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

Future selectTextFromPDF(
  BuildContext context,
  String? pdfLink,
) async {
  // copy selected text from pdf link file
// Check if pdfLink is not null
  if (pdfLink != null) {
    // Create an instance of PdfViewerController

    // Load the PDF file from the given link
    SfPdfViewer.network(pdfLink, enableTextSelection: true,
        onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
      Clipboard.setData(ClipboardData(text: details.selectedText!));
    });

    // Show a snackbar to indicate that the text has been copied
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected text copied to clipboard'),
      ),
    );
  }
}
