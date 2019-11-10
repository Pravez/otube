
import 'package:json_annotation/json_annotation.dart';
part 'author_thumbnail.g.dart';

@JsonSerializable(nullable: false)
class AuthorThumbnail {
  final String url;
  final int width;
  final int height;

  AuthorThumbnail({this.url, this.width, this.height});

  factory AuthorThumbnail.fromJson(Map<String, dynamic> json) => _$AuthorThumbnailFromJson(json);
}