import 'package:json_annotation/json_annotation.dart';

import 'video_thumbnail.dart';

part 'video.g.dart';

const List<String> VIDEO_QUALITIES = [
  "maxres",
  "maxresdefault",
  "sddefault",
  "high",
  "medium"
];

@JsonSerializable(nullable: false)
class Video {
  final String title;
  final String videoId;
  final int lengthSeconds;
  final int viewCount;
  final String author;
  final String authorId;
  final String authorUrl;
  final int published;
  final String publishedText;

  final List<VideoThumbnail> videoThumbnails;

  Video(
      {this.title,
      this.videoId,
      this.lengthSeconds,
      this.viewCount,
      this.author,
      this.authorId,
      this.authorUrl,
      this.published,
      this.publishedText,
      this.videoThumbnails});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
