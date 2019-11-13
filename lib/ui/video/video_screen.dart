import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/bloc/invidious_video_bloc.dart';
import 'package:otube/ui/components/invidious_video_player.dart';
import 'package:otube/ui/video/video_screen_arguments.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  static const route = "/video";
  final VideoScreenArguments arguments;

  const VideoScreen({Key key, @required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BlocProvider(
          builder: (context) => InvidiousVideoBloc(),
          child: InvidiousVideoHandler(
            video: arguments.video,
          ),
        ));
  }
}
