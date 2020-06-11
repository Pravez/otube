import 'package:json_annotation/json_annotation.dart';

part 'format_stream.g.dart';

@JsonSerializable(nullable: false)
class FormatStream {
  final String url;
  final String itag;
  final String type;
  final String quality;
  final String container;
  final String encoding;
  final String qualityLabel;
  final String resolution;
  final String size;

  FormatStream(
      {this.url,
      this.itag,
      this.type,
      this.quality,
      this.container,
      this.encoding,
      this.qualityLabel,
      this.resolution,
      this.size});

  factory FormatStream.fromJson(Map<String, dynamic> json) =>
      _$FormatStreamFromJson(json);
}
