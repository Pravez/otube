import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:otube/service/dto/CompleteVideo.dart';

import 'dto/Video.dart';

class VideoService {
  static const BASE_URL = "https://invidio.us";
  static const TOP_ENDPOINT = "/api/v1/top";
  static const TRENDING_ENDPOINT = "/api/v1/trending";
  static const POPULAR_ENDPOINT = "/api/v1/popular";
  static const VIDEO_ENDPOINT = "/api/v1/videos/:id";

  static Future<List<Video>> fetchTop() async {
    final response = await http.get(BASE_URL + TOP_ENDPOINT);

    if (response.statusCode == 200) {
      return createVideoList(json.decode(response.body.toString()));
    } else {
      throw Exception("Failed to load top videos");
    }
  }

  static Future<CompleteVideo> fetchVideo(String videoId) async {
    final response = await http.get(BASE_URL + VIDEO_ENDPOINT.replaceFirst(":id", videoId));

    if(response.statusCode == 200) {
      return CompleteVideo.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception("Failed to load video with id $videoId");
    }
  }

  static List<Video> createVideoList(List data)  {
    List<Video> videos = new List();

    for(int i = 0;i<data.length;++i) {
      videos.add(Video.fromJson(data[i]));
    }

    return videos;
  }
}