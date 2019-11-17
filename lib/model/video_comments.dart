import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:otube/model/video_comment.dart';

part 'video_comments.g.dart';

@JsonSerializable(nullable: false)
class VideoComments {
  final int commentCount;
  final String videoId;
  final List<VideoComment> comments;
  final String continuation;

  VideoComments(
      {this.commentCount, this.videoId, this.comments, this.continuation});

  factory VideoComments.fromJson(Map<String, dynamic> json) =>
      _$VideoCommentsFromJson(json);
}
