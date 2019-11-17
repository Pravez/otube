import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/model/video.dart';
import 'package:otube/model/video_thumbnail.dart';
import 'package:otube/utils/utils.dart';

class VideoThumbnailImage extends StatefulWidget {
  final List<VideoThumbnail> thumbnails;

  const VideoThumbnailImage({Key key, this.thumbnails}) : super(key: key);

  @override
  _VideoThumbnailImageState createState() => _VideoThumbnailImageState();
}

class _VideoThumbnailImageState extends State<VideoThumbnailImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CachedNetworkImage>(
        future: loadThumbnail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else if (snapshot.hasError) {
            return Text("Error");
          }

          return CircularProgressIndicator();
        });
  }

  Future<CachedNetworkImage> loadThumbnail() async {
    return CachedNetworkImage(
      imageUrl: getBestThumbnailUrl(),
      fit: BoxFit.cover,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, error, err) => Text("error"),
    );
  }

  Future<String> getGoodUrl(List<String> urls) async {
    for (var url in urls) {
      if (await Utils.checkResourceExists(url)) {
        return url;
      }
    }
    return "";
  }

  String getBestThumbnailUrl(
      {VideoThumbnailQuality priority = VideoThumbnailQuality.LOW}) {
    final sortFunc = priority == VideoThumbnailQuality.LOW ?
        (a, b) =>
        VIDEO_QUALITIES.indexOf(a.quality).compareTo(
            VIDEO_QUALITIES.indexOf(b.quality)) :
        (a, b) =>
        VIDEO_QUALITIES.indexOf(b.quality).compareTo(
            VIDEO_QUALITIES.indexOf(a.quality));
    final thumbnails = widget.thumbnails.toList();
    return thumbnails.firstWhere((thumb) => thumb.url != null).url;
  }
}
