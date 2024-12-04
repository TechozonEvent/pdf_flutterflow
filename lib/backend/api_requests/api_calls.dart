import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SplitPDFCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "$pdfUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Split PDF',
      apiUrl:
          'https://us-central1-pdf-maker-d6b7a.cloudfunctions.net/splitPdfFunctions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MergePdfCall {
  static Future<ApiCallResponse> call({
    List<String>? urlsList,
  }) async {
    final urls = _serializeList(urlsList);

    final ffApiRequestBody = '''
{
  "pdfUrls": $urls
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'merge Pdf',
      apiUrl: 'https://us-central1-pdf-maker-d6b7a.cloudfunctions.net/mergePdf',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddWatermarkCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
    String? watermarkTextSampleWatermark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}",
  "watermarkText": "${escapeStringForJson(watermarkTextSampleWatermark)}",
  "fontSize": 36,
  "opacity": 0.5
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'add Watermark',
      apiUrl:
          'https://us-central1-pdf-maker-d6b7a.cloudfunctions.net/addWatermark',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CompressPdfCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'compress pdf',
      apiUrl:
          'https://us-central1-pdf-maker-d6b7a.cloudfunctions.net/compressPdf',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PdfToJpegCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdf to jpeg',
      apiUrl: 'https://us-central1-pdf-maker-d6b7a.cloudfunctions.net/pdfToJpg',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PdfToPowerPointCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdf to powerPoint',
      apiUrl: 'https://convertpdftoppt-poj2oqz45q-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PdfToWordCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdf to word',
      apiUrl: 'https://convertpdftoword-poj2oqz45q-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrganizePdfCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'organizePdf',
      apiUrl:
          'https://us-central1-pdf-maker-d6b7a.cloudfunctions.net/organizePDF',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PdftoexcelCall {
  static Future<ApiCallResponse> call({
    String? pdfUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdftoexcel',
      apiUrl: 'https://convertpdftoexcel-poj2oqz45q-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
