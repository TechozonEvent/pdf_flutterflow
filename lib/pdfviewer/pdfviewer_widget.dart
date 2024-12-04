import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdfviewer_model.dart';
export 'pdfviewer_model.dart';

class PdfviewerWidget extends StatefulWidget {
  const PdfviewerWidget({
    super.key,
    this.tapped,
  });

  final String? tapped;

  @override
  State<PdfviewerWidget> createState() => _PdfviewerWidgetState();
}

class _PdfviewerWidgetState extends State<PdfviewerWidget> {
  late PdfviewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfviewerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).info,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  'pdfs',
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
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Divider(
                  thickness: 2.0,
                  color: Color(0xFF393939),
                ),
                Builder(
                  builder: (context) {
                    final listOfPdfs = FFAppState().splittedUrls.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listOfPdfs.length,
                      itemBuilder: (context, listOfPdfsIndex) {
                        final listOfPdfsItem = listOfPdfs[listOfPdfsIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Container(
                            width: 100.0,
                            height: 125.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1F1F27),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowPdfViewer(
                                    networkPath: FFAppState()
                                        .splittedUrls[listOfPdfsIndex],
                                    width: 100.0,
                                    height: 128.0,
                                    horizontalScroll: false,
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(FFAppState()
                                              .splittedUrls[listOfPdfsIndex]);
                                        },
                                        child: const Icon(
                                          Icons.download_for_offline_outlined,
                                          color: Color(0x79FFFFFF),
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
