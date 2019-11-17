import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/bloc/invidious_query_bloc.dart';
import 'package:otube/model/video.dart';
import 'package:otube/model/video_list_result.dart';
import 'package:otube/bloc/service/invidious_query_event.dart';
import 'package:otube/bloc/service/invidious_query_type.dart';
import 'package:otube/bloc/state/invidious_query_state.dart';
import 'package:otube/ui/components/video/video_thumbnail.dart';
import 'package:otube/ui/video/video_screen.dart';
import 'package:otube/ui/video/video_screen_arguments.dart';
import 'package:otube/utils/utils.dart';

class VideoList extends StatefulWidget {
  final InvidiousQueryType type;

  const VideoList({Key key, @required this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  InvidiousQueryBloc _queryBloc;

  @override
  void initState() {
    super.initState();
    _queryBloc = BlocProvider.of(context);
    _queryBloc.add(Refresh(type: widget.type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvidiousQueryBloc, InvidiousQueryState>(
      bloc: BlocProvider.of(context),
      builder: (context, state) {
        if (state is InvidiousQueryLoading) {
          return CircularProgressIndicator();
        }
        if (state is InvidiousQueryError) {
          return Text("Error");
        }
        if (state is InvidiousQuerySuccess) {
          return Container(
            child: Center(
              child: RefreshIndicator(
                onRefresh: () =>
                    Future(() => _queryBloc.add(Refresh(type: widget.type))),
                child: _VideoList(result: state.result),
              ),
            ),
          );
        }
        return Text("Nothing here ...");
      },
    );
  }
}

class _VideoList extends StatelessWidget {
  final VideoListResult result;

  const _VideoList({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.videos.length,
      itemBuilder: (context, position) =>
          _buildVideo(context, result.videos[position]),
    );
  }

  _buildVideo(BuildContext context, Video video) {
    return GestureDetector(
      onTap: () => _videoTapped(context, video),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: VideoThumbnailImage(
                thumbnails: video.videoThumbnails,
              ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          video.title,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Text(
                        video.author,
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  flex: 9,
                ),
                Expanded(
                  child: Icon(Icons.more_vert),
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _videoTapped(BuildContext context, Video video) {
    Navigator.pushNamed(context, VideoScreen.route,
        arguments: VideoScreenArguments(video));
  }
}
