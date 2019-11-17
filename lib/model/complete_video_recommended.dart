

import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:otube/model/video_thumbnail.dart';

part 'complete_video_recommended.g.dart';

@JsonSerializable(nullable: false)
class CompleteVideoRecommended {
  final String videoId;
  final String title;
  final List<VideoThumbnail> videoThumbnails;
  final String author;
  final int lengthSeconds;
  final String viewCountText;

  CompleteVideoRecommended(this.videoId, this.title, this.videoThumbnails, this.author, this.lengthSeconds, this.viewCountText);

  factory CompleteVideoRecommended.fromJson(Map<String, dynamic> json) => _$CompleteVideoRecommendedFromJson(json);
}