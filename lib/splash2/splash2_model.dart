import '/flutter_flow/flutter_flow_util.dart';
import 'splash2_widget.dart' show Splash2Widget;
import 'package:flutter/material.dart';

class Splash2Model extends FlutterFlowModel<Splash2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
