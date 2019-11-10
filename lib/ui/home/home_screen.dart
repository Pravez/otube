import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/bloc/invidious_query_bloc.dart';
import 'package:otube/ui/components/video_list.dart';


class HomeScreen extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocProvider(
        builder: (context) => InvidiousQueryBloc(),
        child: VideoList(),
      ),
    );
  }
}


  /*trendingBuilder() {
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
    Navigator.pushNamed(
      context,
      OVideo.route,
      arguments: OVideoArguments(video.videoId)
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
                child: FutureBuilder<CachedNetworkImage>(
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

  Future<CachedNetworkImage> loadThumbnail(Video video) async {
    return getGoodUrl(video.videoThumbnails.map((thumb) => thumb.url).toList())
        .then((url) => CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.fill,
              placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, error, err) => Text("error"),
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
  }*/

