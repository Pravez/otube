import 'package:json_annotation/json_annotation.dart';
import 'package:otube/model/video_thumbnail.dart';

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

  Video({this.title,
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

  String getBestThumbnailUrl(
      {VideoThumbnailQuality priority = VideoThumbnailQuality.LOW}) {
    final sortFunc = priority == VideoThumbnailQuality.LOW ?
        (a, b) =>
        VIDEO_QUALITIES.indexOf(a.quality).compareTo(
            VIDEO_QUALITIES.indexOf(b.quality)) :
    (a, b) =>
        VIDEO_QUALITIES.indexOf(b.quality).compareTo(
            VIDEO_QUALITIES.indexOf(a.quality));
        videoThumbnails.sort(sortFunc);
        return videoThumbnails.firstWhere((thumb) => thumb.url != null).url;
  }
}