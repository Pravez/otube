import 'package:otube/service/dto/Video.dart';

class CompleteVideo extends Video {
  final String description;
  final List<String> keywords;
  final int likeCount;
  final int dislikeCount;

  final String genre;

  CompleteVideo(
      {this.description,
      this.keywords,
      this.likeCount,
      this.dislikeCount,
      this.genre});

  factory CompleteVideo.fromJson(Map<String, dynamic> json) {
    return CompleteVideo(
        description: json["description"],
        keywords: json["keywords"],
        likeCount: json["likeCount"],
        dislikeCount: json["dislikeCount"],
        genre: json["genre"]);
  }
}
