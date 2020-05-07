import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/model/complete_video.dart';
import 'package:otube/model/complete_video_recommended.dart';
import 'package:otube/ui/components/video/video_thumbnail.dart';
import 'package:otube/ui/video/video_screen.dart';
import 'package:otube/ui/video/video_screen_arguments.dart';
import 'package:otube/utils/utils.dart';

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
      children: videos.map((video) => _buildTile(context, video)).toList(),
    );
  }

  ListTile _buildTile(BuildContext context, CompleteVideoRecommended video) {
    return ListTile(
      onTap: () => _videoTapped(context, video.videoId),
      leading: FittedBox(
        fit: BoxFit.contain,
        child: VideoThumbnailImage(
          thumbnails: video.videoThumbnails,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        video.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13.0),
      ),
      subtitle: Text(
        "${video.author}\n${Utils.format(Duration(seconds: video.lengthSeconds))}",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12.0),
      ),
      isThreeLine: true,
    );
  }

  _videoTapped(BuildContext context, String videoId) {
    Navigator.pushReplacementNamed(context, VideoScreen.route,
        arguments: VideoScreenArguments(videoId));
  }
}
