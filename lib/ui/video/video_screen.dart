import 'package:otube/model/complete_video.dart';
import 'package:otube/ui/video/video_screen_arguments.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  static const route = '/video';

  const VideoScreen({Key key, this.arguments}) : super(key: key);
  final OVideoArguments arguments;

  @override
  _VideoScreenState createState() => _VideoScreenState(arguments);
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  CompleteVideo video;

  _VideoScreenState(this.arguments);

  final OVideoArguments arguments;

  @override
  void initState() {
    super.initState();
    /*VideoService.fetchVideo(arguments.videoId).then((vid) {
      video = vid;
      _controller = VideoPlayerController.network(video.formatStreams[0].url)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      _controller != null && _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : CircularProgressIndicator(),
      Container(
        child: IconButton(
          icon: Icon(
            _controller != null
                ? _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
                : Icons.do_not_disturb_on,
          ),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        ),
      )
    ]));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
