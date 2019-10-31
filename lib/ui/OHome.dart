import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:otube/service/VideoService.dart';
import 'package:otube/service/dto/Video.dart';
import 'package:otube/utils/Utils.dart';

import 'OVideo.dart';
import 'dart:async' as async;

class OHome extends StatefulWidget {
  OHome({Key key}) : super(key: key);

  @override
  _OHome createState() => _OHome();
}

class _OHome extends State<OHome> {
  Future<List<Video>> videos;

  @override
  void initState() {
    super.initState();
    videos = VideoService.fetchTop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(child: trendingBuilder()),
    );
  }

  trendingBuilder() {
    return FutureBuilder<List<Video>>(
      future: videos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return videosBuilder(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }

  videoTapped(Video video) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OVideo(
                videoId: video.videoId,
              )),
    );
  }

  videosBuilder(List<Video> videos) {
    var cards = videos
        .map((video) => Center(
                child: GestureDetector(
              onTap: () => videoTapped(video),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: FutureBuilder<Image>(
                    future: loadThumbnail(video),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data;
                      } else if (snapshot.hasError) {
                        return Text("Error");
                      }

                      return CircularProgressIndicator();
                    }),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            )))
        .toList();
    return ListView(
      children: cards,
    );
  }

  Future<Image> loadThumbnail(Video video) async {
    return getGoodUrl(video.videoThumbnails.map((thumb) => thumb.url).toList())
        .then((url) => Image.network(
              url,
              fit: BoxFit.fill,
            ));
  }

  Future<String> getGoodUrl(List<String> urls) async {
    for (var url in urls) {
      if (await Utils.checkResourceExists(url)) {
        return url;
      }
    }
    return "";
  }

  listBuilder(List<Video> videos) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: videoTapped(videos[index]),
          leading: CircleAvatar(
            child: Image.network(videos[index].videoThumbnails[0].url),
          ),
          title: Text(videos[index].title),
          subtitle: Text(videos[index].author),
        );
      },
    );
  }
}
