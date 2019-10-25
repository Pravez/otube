class Video {
  final String title;
  final String videoId;
  final int lengthSeconds;
  final int viewCount;
  final String author;
  final String authorId;
  final String authorUrl;
  final int published;
  final String publishedText;

  final List<VideoThumbnail> videoThumbnails;

  Video(
      {this.title,
      this.videoId,
      this.lengthSeconds,
      this.viewCount,
      this.author,
      this.authorId,
      this.authorUrl,
      this.published,
      this.publishedText,
      this.videoThumbnails});

  factory Video.fromJson(Map<String, dynamic> json) {
    /*List<VideoThumbnail> thumbnails = new List();
    for(var thumb in json["videoThumbnails"]) {
      thumbnails.add(VideoThumbnail.fromJson(thumb));
    }*/
    return Video(
      title: json["title"],
      videoId: json["videoId"],
      lengthSeconds: json["lengthSeconds"],
      viewCount: json["viewCount"],
      author: json["author"],
      authorId: json["authorId"],
      authorUrl: json["authorUrl"],
      published: json["published"],
      publishedText: json["publishedText"],
      videoThumbnails: [VideoThumbnail.fromJson(json["videoThumbnails"][0])]
    );
  }
}

class VideoThumbnail {
  final String quality;
  final String url;
  final int width;
  final int height;

  VideoThumbnail({this.quality, this.url, this.width, this.height});

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) {
    return VideoThumbnail(
      quality: json["quality"],
      url: json["url"],
      width: json["width"],
      height: json["height"]
    );
  }
}
