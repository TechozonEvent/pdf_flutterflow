import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 98.25,
            height: 106.5,
            decoration: const BoxDecoration(
              color: Color(0xFF191920),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('dashboard');
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.home,
                        color: Color(0xFF3F80FF),
                        size: 25.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.06, 0.47),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'Home',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: const Color(0xFF3F80FF),
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Poppins'),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 98.25,
            height: 106.5,
            decoration: const BoxDecoration(
              color: Color(0xFF191920),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Files');
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.folderOpen,
                        color: Color(0xFF3F80FF),
                        size: 25.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.06, 0.47),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'files',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: const Color(0xFF3F80FF),
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Poppins'),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 98.25,
            height: 106.5,
            decoration: const BoxDecoration(
              color: Color(0xFF191920),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('alltools');
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.magic,
                        color: Color(0xFF3F80FF),
                        size: 25.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.06, 0.47),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'tools',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: const Color(0xFF3F80FF),
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Poppins'),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 98.25,
            height: 106.5,
            decoration: const BoxDecoration(
              color: Color(0xFF191920),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('profile');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Color(0xFF3F80FF),
                          size: 28.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.06, 0.47),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Setting',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: const Color(0xFF3F80FF),
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
