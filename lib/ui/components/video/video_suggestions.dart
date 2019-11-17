import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/model/complete_video.dart';
import 'package:otube/ui/components/video/video_thumbnail.dart';

class VideoSuggestions extends StatefulWidget {
  final CompleteVideo video;

  const VideoSuggestions({Key key, this.video}) : super(key: key);

  @override
  _VideoSuggestionsState createState() => _VideoSuggestionsState();
}

class _VideoSuggestionsState extends State<VideoSuggestions> {
  @override
  Widget build(BuildContext context) {
    final videos = widget.video.recommendedVideos;
    return Column(
      children: videos
          .map((video) => ListTile(
                leading: VideoThumbnailImage(thumbnails: video.videoThumbnails,),
              ))
          .toList(),
    );
  }
}
