// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_video_recommended.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteVideoRecommended _$CompleteVideoRecommendedFromJson(
    Map<String, dynamic> json) {
  return CompleteVideoRecommended(
    json['videoId'] as String,
    json['title'] as String,
    (json['videoThumbnails'] as List)
        .map((e) => VideoThumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['author'] as String,
    json['lengthSeconds'] as int,
    json['viewCountText'] as String,
  );
}

Map<String, dynamic> _$CompleteVideoRecommendedToJson(
        CompleteVideoRecommended instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'videoThumbnails': instance.videoThumbnails,
      'author': instance.author,
      'lengthSeconds': instance.lengthSeconds,
      'viewCountText': instance.viewCountText,
    };
