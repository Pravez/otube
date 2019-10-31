import 'package:flutter/cupertino.dart';

class CompleteVideo {
  final String title;
  final String videoId;
  final String description;
  final List<String> keywords;
  final int likeCount;
  final int dislikeCount;
  final String genre;

  final String author;
  final String authorId;
  final String authorUrl;
  final List<AuthorThumbnail> authorThumbnails;

  final List<FormatStream> formatStreams;

  CompleteVideo(
      {this.author,
      this.authorId,
      this.authorUrl,
      this.authorThumbnails,
      this.formatStreams,
      this.title,
      this.videoId,
      this.description,
      this.keywords,
      this.likeCount,
      this.dislikeCount,
      this.genre});

  factory CompleteVideo.fromJson(Map<String, dynamic> json) {
    return CompleteVideo(
        title: json["title"],
        videoId: json["videoId"],
        description: json["description"],
        keywords: json["keywords"].cast<String>(),
        likeCount: json["likeCount"],
        dislikeCount: json["dislikeCount"],
        genre: json["genre"],
        authorUrl: json["authorUrl"],
        authorId: json["authorId"],
        author: json["author"],
        authorThumbnails: json["authorThumbnails"]
            .map((thumbnail) => AuthorThumbnail.fromJson(thumbnail))
            .toList()
            .cast<AuthorThumbnail>(),
        formatStreams: json["formatStreams"]
            .map((stream) => FormatStream.fromJson(stream))
            .toList()
            .cast<FormatStream>());
  }
}

class AuthorThumbnail {
  final String url;
  final int width;
  final int height;

  AuthorThumbnail({this.url, this.width, this.height});

  factory AuthorThumbnail.fromJson(Map<String, dynamic> json) {
    return AuthorThumbnail(
        url: json["url"], width: json["width"], height: json["height"]);
  }
}

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

  factory FormatStream.fromJson(Map<String, dynamic> json) {
    return FormatStream(
        url: json["url"],
        itag: json["itag"],
        type: json["type"],
        quality: json["quality"],
        container: json["container"],
        encoding: json["encoding"],
        qualityLabel: json["qualityLabel"],
        resolution: json["resolution"],
        size: json["size"]);
  }
}
