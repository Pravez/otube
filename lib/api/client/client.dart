import 'dart:convert';

import 'package:flutter_cache_store/flutter_cache_store.dart';
import 'package:http/http.dart' as http;

import 'instance.dart';

abstract class HttpClient {
  final http.Client _client;

  HttpClient() : this._client = http.Client();

  Future<http.Response> fetchResponse(path,
      {Map<String, dynamic> custom, Map<String, String> headers}) async {
    try {
      final data = custom ?? {};
      final url = "${Instance.get()}$path";
      final response = await (data['method'] ?? '' == "POST"
          ? _client.post(url, headers: headers, body: data['body'])
          : _client.get(url, headers: headers));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Unable to fetch $path");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<dynamic> fetchJson(String path,
      {Map<String, String> headers, Map<String, dynamic> custom}) async {
    throw UnimplementedError();
  }
}
