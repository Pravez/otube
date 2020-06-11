
import 'video.dart';

class VideoList {
  final List<Video> videos;

  VideoList({this.videos});

  factory VideoList.fromJson(List<dynamic> json) {
    return VideoList(
        videos: json
            .map((item) => Video.fromJson(item as Map<String, dynamic>))
            .toList());
  }
}
