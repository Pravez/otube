// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoComments _$VideoCommentsFromJson(Map<String, dynamic> json) {
  return VideoComments(
    commentCount: json['commentCount'] as int,
    videoId: json['videoId'] as String,
    comments: (json['comments'] as List)
        .map((e) => VideoComment.fromJson(e as Map<String, dynamic>))
        .toList(),
    continuation: json['continuation'] as String,
  );
}

Map<String, dynamic> _$VideoCommentsToJson(VideoComments instance) =>
    <String, dynamic>{
      'commentCount': instance.commentCount,
      'videoId': instance.videoId,
      'comments': instance.comments,
      'continuation': instance.continuation,
    };
