// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adaptive_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdaptiveFormat _$AdaptiveFormatFromJson(Map<String, dynamic> json) {
  return AdaptiveFormat(
    index: json['index'] as String,
    bitrate: json['bitrate'] as String,
    url: json['url'] as String,
    itag: json['itag'] as String,
    type: json['type'] as String,
    clen: json['clen'] as String,
    lmt: json['lmt'] as String,
    projectionType: json['projectionType'] as String,
    container: json['container'] as String,
    encoding: json['encoding'] as String,
    qualityLabel: json['qualityLabel'] as String,
    resolution: json['resolution'] as String,
  );
}

Map<String, dynamic> _$AdaptiveFormatToJson(AdaptiveFormat instance) =>
    <String, dynamic>{
      'index': instance.index,
      'bitrate': instance.bitrate,
      'url': instance.url,
      'itag': instance.itag,
      'type': instance.type,
      'clen': instance.clen,
      'lmt': instance.lmt,
      'projectionType': instance.projectionType,
      'container': instance.container,
      'encoding': instance.encoding,
      'qualityLabel': instance.qualityLabel,
      'resolution': instance.resolution,
    };
