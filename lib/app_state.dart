import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _mergePdfs = [];
  List<String> get mergePdfs => _mergePdfs;
  set mergePdfs(List<String> value) {
    _mergePdfs = value;
  }

  void addToMergePdfs(String value) {
    mergePdfs.add(value);
  }

  void removeFromMergePdfs(String value) {
    mergePdfs.remove(value);
  }

  void removeAtIndexFromMergePdfs(int index) {
    mergePdfs.removeAt(index);
  }

  void updateMergePdfsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    mergePdfs[index] = updateFn(_mergePdfs[index]);
  }

  void insertAtIndexInMergePdfs(int index, String value) {
    mergePdfs.insert(index, value);
  }

  String _uploadedPDF = '';
  String get uploadedPDF => _uploadedPDF;
  set uploadedPDF(String value) {
    _uploadedPDF = value;
  }

  List<String> _splittedUrls = [];
  List<String> get splittedUrls => _splittedUrls;
  set splittedUrls(List<String> value) {
    _splittedUrls = value;
  }

  void addToSplittedUrls(String value) {
    splittedUrls.add(value);
  }

  void removeFromSplittedUrls(String value) {
    splittedUrls.remove(value);
  }

  void removeAtIndexFromSplittedUrls(int index) {
    splittedUrls.removeAt(index);
  }

  void updateSplittedUrlsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    splittedUrls[index] = updateFn(_splittedUrls[index]);
  }

  void insertAtIndexInSplittedUrls(int index, String value) {
    splittedUrls.insert(index, value);
  }

  String _mergedPdf = '';
  String get mergedPdf => _mergedPdf;
  set mergedPdf(String value) {
    _mergedPdf = value;
  }

  String _signatureData = '';
  String get signatureData => _signatureData;
  set signatureData(String value) {
    _signatureData = value;
  }

  String _waterMarkedPdf = '';
  String get waterMarkedPdf => _waterMarkedPdf;
  set waterMarkedPdf(String value) {
    _waterMarkedPdf = value;
  }

  String _waterMarkText = '';
  String get waterMarkText => _waterMarkText;
  set waterMarkText(String value) {
    _waterMarkText = value;
  }

  String _compressUrl = '';
  String get compressUrl => _compressUrl;
  set compressUrl(String value) {
    _compressUrl = value;
  }

  String _jpgUrls = '';
  String get jpgUrls => _jpgUrls;
  set jpgUrls(String value) {
    _jpgUrls = value;
  }

  List<String> _jpgUrlsss = [];
  List<String> get jpgUrlsss => _jpgUrlsss;
  set jpgUrlsss(List<String> value) {
    _jpgUrlsss = value;
  }

  void addToJpgUrlsss(String value) {
    jpgUrlsss.add(value);
  }

  void removeFromJpgUrlsss(String value) {
    jpgUrlsss.remove(value);
  }

  void removeAtIndexFromJpgUrlsss(int index) {
    jpgUrlsss.removeAt(index);
  }

  void updateJpgUrlsssAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    jpgUrlsss[index] = updateFn(_jpgUrlsss[index]);
  }

  void insertAtIndexInJpgUrlsss(int index, String value) {
    jpgUrlsss.insert(index, value);
  }

  String _PptUrl = '';
  String get PptUrl => _PptUrl;
  set PptUrl(String value) {
    _PptUrl = value;
  }
}
