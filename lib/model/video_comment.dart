import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

import 'author_thumbnail.dart';
import 'format_stream.dart';

part 'video_comment.g.dart';

@JsonSerializable(nullable: false)
class VideoComment {
  final String author;
  final List<AuthorThumbnail> authorThumbnails;
  final String authorId;
  final String authorUrl;
  final bool isEdited;
  final String content;
  final String contentHtml;
  final int published;
  final String publishedText;
  final int likeCount;
  final String commentId;
  final bool authorIsChannelOwner;
  final CreatorHeart creatorHeart;
  final Replies replies;

  VideoComment(
      {this.author,
      this.authorThumbnails,
      this.authorId,
      this.authorUrl,
      this.isEdited,
      this.content,
      this.contentHtml,
      this.published,
      this.publishedText,
      this.likeCount,
      this.commentId,
      this.authorIsChannelOwner,
      this.creatorHeart,
      this.replies});

  factory VideoComment.fromJson(Map<String, dynamic> json) => _$VideoCommentFromJson(json);
}

@JsonSerializable(nullable: false)
class CreatorHeart {
  final String creatorThumbnail;
  final String creatorName;

  CreatorHeart({this.creatorThumbnail, this.creatorName});
  factory CreatorHeart.fromJson(Map<String, dynamic> json) => _$CreatorHeartFromJson(json);
}

@JsonSerializable(nullable: false)
class Replies {
  final int replyCount;
  final String continuation;

  Replies({this.replyCount, this.continuation});
  factory Replies.fromJson(Map<String, dynamic> json) => _$RepliesFromJson(json);

}
