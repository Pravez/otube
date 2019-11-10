import 'package:json_annotation/json_annotation.dart';

import 'author_thumbnail.dart';
import 'format_stream.dart';

part 'complete_video.g.dart';

@JsonSerializable(nullable: false)
class CompleteVideo {
  final String title;
  final String videoId;
  final String description;
  final List<String> keywords;
  final int likeCount;
  final int dislikeCount;
  final String genre;

  final String author;
  final String authorId;
  final String authorUrl;
  final List<AuthorThumbnail> authorThumbnails;

  final List<FormatStream> formatStreams;

  CompleteVideo(
      {this.author,
      this.authorId,
      this.authorUrl,
      this.authorThumbnails,
      this.formatStreams,
      this.title,
      this.videoId,
      this.description,
      this.keywords,
      this.likeCount,
      this.dislikeCount,
      this.genre});

  factory CompleteVideo.fromJson(Map<String, dynamic> json) => _$CompleteVideoFromJson(json);
}
