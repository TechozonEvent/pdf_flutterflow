import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alltools_widget.dart' show AlltoolsWidget;
import 'package:flutter/material.dart';

class AlltoolsModel extends FlutterFlowModel<AlltoolsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
