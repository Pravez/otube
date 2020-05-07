// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    title: json['title'] as String,
    videoId: json['videoId'] as String,
    lengthSeconds: json['lengthSeconds'] as int,
    viewCount: json['viewCount'] as int,
    author: json['author'] as String,
    authorId: json['authorId'] as String,
    authorUrl: json['authorUrl'] as String,
    published: json['published'] as int,
    publishedText: json['publishedText'] as String,
    videoThumbnails: (json['videoThumbnails'] as List)
        .map((e) => VideoThumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'title': instance.title,
      'videoId': instance.videoId,
      'lengthSeconds': instance.lengthSeconds,
      'viewCount': instance.viewCount,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'published': instance.published,
      'publishedText': instance.publishedText,
      'videoThumbnails': instance.videoThumbnails,
    };
