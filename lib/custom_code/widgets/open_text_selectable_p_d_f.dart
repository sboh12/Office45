// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class OpenTextSelectablePDF extends StatefulWidget {
  const OpenTextSelectablePDF({
    super.key,
    this.width,
    this.height,
    required this.pdfLink,
  });

  final double? width;
  final double? height;
  final String pdfLink;

  @override
  State<OpenTextSelectablePDF> createState() => _OpenTextSelectablePDFState();
}

class _OpenTextSelectablePDFState extends State<OpenTextSelectablePDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.network(widget.pdfLink,
            enableTextSelection: true,
            scrollDirection: PdfScrollDirection.horizontal,
            onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
      Clipboard.setData(ClipboardData(text: details.selectedText!));
      FFAppState().update(() {
        FFAppState().copiedPDF =
            ClipboardData(text: details.selectedText!).text!;
      });
    }));
  }
}
