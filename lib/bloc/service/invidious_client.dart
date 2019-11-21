import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:otube/model/complete_video.dart';
import 'package:otube/model/invidious_instances.dart';
import 'package:otube/model/video_comments.dart';
import 'package:otube/model/video_list_result.dart';

class InvidiousClient {
  final String baseUrl;
  final http.Client httpClient;

  InvidiousClient(
      {http.Client httpClient,
      this.baseUrl = "https://" + InvidiousInstances.mainInstance + "/api/v1/"})
      : this.httpClient = httpClient ?? http.Client();

  Future<VideoListResult> top() async =>
      _fetch("top").then((json) => VideoListResult.fromJson(json));

  Future<VideoListResult> trending() async =>
      _fetch("trending").then((json) => VideoListResult.fromJson(json));

  Future<CompleteVideo> video(String id) async =>
      _fetch("videos/$id").then((json) => CompleteVideo.fromJson(json));

  Future<VideoComments> comments(String id) async =>
      _fetch("comments/$id").then((json) => VideoComments.fromJson(json));

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
