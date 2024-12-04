import '/flutter_flow/flutter_flow_util.dart';
import 'add_digital_sign_widget.dart' show AddDigitalSignWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class AddDigitalSignModel extends FlutterFlowModel<AddDigitalSignWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature widget.
  SignatureController? signatureController;
  String uploadedSignatureUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signatureController?.dispose();
  }
}
