// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoComment _$VideoCommentFromJson(Map<String, dynamic> json) {
  return VideoComment(
    author: json['author'] as String,
    authorThumbnails: (json['authorThumbnails'] as List)
        .map((e) => AuthorThumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
    authorId: json['authorId'] as String,
    authorUrl: json['authorUrl'] as String,
    isEdited: json['isEdited'] as bool,
    content: json['content'] as String,
    contentHtml: json['contentHtml'] as String,
    published: json['published'] as int,
    publishedText: json['publishedText'] as String,
    likeCount: json['likeCount'] as int,
    commentId: json['commentId'] as String,
    authorIsChannelOwner: json['authorIsChannelOwner'] as bool,
    creatorHeart:
        CreatorHeart.fromJson(json['creatorHeart'] as Map<String, dynamic>),
    replies: Replies.fromJson(json['replies'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoCommentToJson(VideoComment instance) =>
    <String, dynamic>{
      'author': instance.author,
      'authorThumbnails': instance.authorThumbnails,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'isEdited': instance.isEdited,
      'content': instance.content,
      'contentHtml': instance.contentHtml,
      'published': instance.published,
      'publishedText': instance.publishedText,
      'likeCount': instance.likeCount,
      'commentId': instance.commentId,
      'authorIsChannelOwner': instance.authorIsChannelOwner,
      'creatorHeart': instance.creatorHeart,
      'replies': instance.replies,
    };

CreatorHeart _$CreatorHeartFromJson(Map<String, dynamic> json) {
  return CreatorHeart(
    creatorThumbnail: json['creatorThumbnail'] as String,
    creatorName: json['creatorName'] as String,
  );
}

Map<String, dynamic> _$CreatorHeartToJson(CreatorHeart instance) =>
    <String, dynamic>{
      'creatorThumbnail': instance.creatorThumbnail,
      'creatorName': instance.creatorName,
    };

Replies _$RepliesFromJson(Map<String, dynamic> json) {
  return Replies(
    replyCount: json['replyCount'] as int,
    continuation: json['continuation'] as String,
  );
}

Map<String, dynamic> _$RepliesToJson(Replies instance) => <String, dynamic>{
      'replyCount': instance.replyCount,
      'continuation': instance.continuation,
    };
