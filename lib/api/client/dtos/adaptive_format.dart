import 'package:json_annotation/json_annotation.dart';

part 'adaptive_format.g.dart';

@JsonSerializable(nullable: false)
class AdaptiveFormat {
  final String index;
  final String bitrate;
  final String url;
  final String itag;
  final String type;
  final String clen;
  final String lmt;
  final String projectionType;
  final String container;
  final String encoding;
  final String qualityLabel;
  final String resolution;

  AdaptiveFormat(
      {this.index,
      this.bitrate,
      this.url,
      this.itag,
      this.type,
      this.clen,
      this.lmt,
      this.projectionType,
      this.container,
      this.encoding,
      this.qualityLabel,
      this.resolution});

  factory AdaptiveFormat.fromJson(Map<String, dynamic> json) =>
      _$AdaptiveFormatFromJson(json);
}
