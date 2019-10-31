import 'package:otube/service/VideoService.dart';
import 'package:otube/service/dto/CompleteVideo.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class OVideo extends StatefulWidget {
  const OVideo({Key key, this.videoId}) : super(key: key);

  final String videoId;

  @override
  _OVideoState createState() => _OVideoState(videoId);
}

class _OVideoState extends State<OVideo> {
  _OVideoState(this.videoId);

  VideoPlayerController _controller;
  final String videoId;
  CompleteVideo video;

  @override
  void initState() {
    super.initState();
    VideoService.fetchVideo(videoId).then((vid) {
      video = vid;
      _controller = VideoPlayerController.network(video.formatStreams[0].url)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    });
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
