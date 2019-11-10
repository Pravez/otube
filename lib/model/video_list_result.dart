

import 'package:otube/model/video.dart';

class VideoListResult {
  final List<Video> videos;

  VideoListResult({this.videos});

  factory VideoListResult.fromJson(List<dynamic> json) {
    return VideoListResult(
      videos: json
          .map((item) => Video.fromJson(item as Map<String, dynamic>))
          .toList()
    );
  }
}