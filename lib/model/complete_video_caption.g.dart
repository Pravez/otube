// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_video_caption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteVideoCaption _$CompleteVideoCaptionFromJson(Map<String, dynamic> json) {
  return CompleteVideoCaption(
    label: json['label'] as String,
    languageCode: json['languageCode'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CompleteVideoCaptionToJson(
        CompleteVideoCaption instance) =>
    <String, dynamic>{
      'label': instance.label,
      'languageCode': instance.languageCode,
      'url': instance.url,
    };
