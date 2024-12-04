import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';
import 'add_digital_sign_model.dart';
export 'add_digital_sign_model.dart';

class AddDigitalSignWidget extends StatefulWidget {
  const AddDigitalSignWidget({super.key});

  @override
  State<AddDigitalSignWidget> createState() => _AddDigitalSignWidgetState();
}

class _AddDigitalSignWidgetState extends State<AddDigitalSignWidget> {
  late AddDigitalSignModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDigitalSignModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF191920),
        appBar: AppBar(
          backgroundColor: const Color(0xFF191920),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).info,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Add sign',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(140.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    Icons.share_outlined,
                    color: Color(0xFFF0F0F0),
                    size: 27.0,
                  ),
                ),
              ),
              const Flexible(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.more_vert,
                      color: Color(0xFFF0F0F0),
                      size: 27.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: ClipRect(
                    child: Signature(
                      controller: _model.signatureController ??=
                          SignatureController(
                        penStrokeWidth: 2.0,
                        penColor: FlutterFlowTheme.of(context).primaryText,
                        exportBackgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      backgroundColor: const Color(0xFF191920),
                      height: 634.0,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Cancel',
                              options: FFButtonOptions(
                                width: 179.0,
                                height: 55.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF34383F),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final signatureImage = await _model
                                    .signatureController!
                                    .toPngBytes(height: 634);
                                if (signatureImage == null) {
                                  showUploadMessage(
                                    context,
                                    'Signature is empty.',
                                  );
                                  return;
                                }
                                showUploadMessage(
                                  context,
                                  'Uploading signature...',
                                  showLoading: true,
                                );
                                final downloadUrl = (await uploadData(
                                    getSignatureStoragePath(), signatureImage));

                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  safeSetState(() => _model
                                      .uploadedSignatureUrl = downloadUrl);
                                  showUploadMessage(
                                    context,
                                    'Success!',
                                  );
                                } else {
                                  showUploadMessage(
                                    context,
                                    'Failed to upload signature.',
                                  );
                                  return;
                                }

                                context.pushNamed(
                                  'addDigitalSign2',
                                  queryParameters: {
                                    'signatureUrl': serializeParam(
                                      _model.uploadedSignatureUrl,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Save',
                              options: FFButtonOptions(
                                width: 179.0,
                                height: 55.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF4C64FC),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
