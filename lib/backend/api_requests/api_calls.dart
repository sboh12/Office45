import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = 'N/A',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'api.mux.com/video/v1/assets?live_stream_id=${streamId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZTNhYTBlYjItOWY1My00NDhlLTlkMDQtZDI0ZTRhMzk2ZGJlOml6UDRsajcvWTloSW9HdEUrSkpSYzlDc0FETGlleGcrQVB6TC93ZHluNHJLaVdrV2hhYXdzSjZ6RksrL1E2cSt5OVlvTXV3ekpyeA==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic playbackid(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class GetLiveStreamIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamId',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/${playbackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZTNhYTBlYjItOWY1My00NDhlLTlkMDQtZDI0ZTRhMzk2ZGJlOml6UDRsajcvWTloSW9HdEUrSkpSYzlDc0FETGlleGcrQVB6TC93ZHluNHJLaVdrV2hhYXdzSjZ6RksrL1E2cSt5OVlvTXV3ekpyeA==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic playbackid(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
  static dynamic streamid(dynamic response) => getJsonField(
        response,
        r'''$.data.object.id''',
      );
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
