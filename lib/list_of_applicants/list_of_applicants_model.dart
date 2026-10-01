import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/checkboks_element_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'list_of_applicants_widget.dart' show ListOfApplicantsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfApplicantsModel extends FlutterFlowModel<ListOfApplicantsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for checkboksElement dynamic component.
  late FlutterFlowDynamicModels<CheckboksElementModel> checkboksElementModels;

  @override
  void initState(BuildContext context) {
    checkboksElementModels =
        FlutterFlowDynamicModels(() => CheckboksElementModel());
  }

  @override
  void dispose() {
    checkboksElementModels.dispose();
  }
}
