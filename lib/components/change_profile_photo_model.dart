import '/flutter_flow/flutter_flow_util.dart';
import 'change_profile_photo_widget.dart' show ChangeProfilePhotoWidget;
import 'package:flutter/material.dart';

class ChangeProfilePhotoModel
    extends FlutterFlowModel<ChangeProfilePhotoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
