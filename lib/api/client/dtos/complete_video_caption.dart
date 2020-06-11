import 'package:json_annotation/json_annotation.dart';
part 'complete_video_caption.g.dart';

@JsonSerializable(nullable: false)
class CompleteVideoCaption {
  final String label;
  final String languageCode;
  final String url;

  CompleteVideoCaption({this.label, this.languageCode, this.url});

  factory CompleteVideoCaption.fromJson(Map<String, dynamic> json) =>
      _$CompleteVideoCaptionFromJson(json);
}
