
import 'package:json_annotation/json_annotation.dart';
part 'video_thumbnail.g.dart';

@JsonSerializable(nullable: false)
class VideoThumbnail {
  final String quality;
  final String url;
  final int width;
  final int height;

  VideoThumbnail({this.quality, this.url, this.width, this.height});

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => _$VideoThumbnailFromJson(json);
}