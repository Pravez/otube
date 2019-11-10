import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:otube/model/video.dart';
import 'package:otube/model/video_list_result.dart';

class InvidiousClient {
  final String baseUrl;
  final http.Client httpClient;

  InvidiousClient(
      {http.Client httpClient, this.baseUrl = "https://invidio.us/api/v1/"})
      : this.httpClient = httpClient ?? http.Client();

  Future<VideoListResult> top() async => _fetch("top")
      .then((json) => VideoListResult.fromJson(json));

  Future<VideoListResult> trending() async => _fetch("trending")
      .then((json) => VideoListResult.fromJson(json));

  Future<Video> video(String id) async =>
      _fetch("videos/$id").then((json) => Video.fromJson(json));

  Future<dynamic> _fetch(String path) async {
    try {
      final response = await httpClient.get(Uri.parse("$baseUrl$path"));
      if (response.statusCode == 200) {
        return json.decode(response.body.toString());
      } else {
        throw Exception("Unable to fetch $path");
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
