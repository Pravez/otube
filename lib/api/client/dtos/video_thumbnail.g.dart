// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoThumbnail _$VideoThumbnailFromJson(Map<String, dynamic> json) {
  return VideoThumbnail(
    quality: json['quality'] as String,
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$VideoThumbnailToJson(VideoThumbnail instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
