// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorThumbnail _$AuthorThumbnailFromJson(Map<String, dynamic> json) {
  return AuthorThumbnail(
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$AuthorThumbnailToJson(AuthorThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
