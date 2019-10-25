import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otube/service/VideoService.dart';
import 'package:otube/service/dto/Video.dart';

class OHome extends StatefulWidget {
  OHome({Key key, this.title}) : super(key: key);

  final String title;

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
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<List<Video>>(
        future: videos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return videosBuilder(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      )),
    );
  }

  videoTapped(Video video) {}



  videosBuilder(List<Video> videos) {
    var cards = videos
        .map((video) => Center(
              child: GestureDetector(
                onTap: videoTapped(video),
                child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: loadImage(video.videoThumbnails[0].url),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            )))
        .toList();
    return Column(
      children: cards,
    );
  }

  Widget loadImage(url)  {
    try {
      return Image.network(url, fit: BoxFit.fill);
    } catch(e){
      return Center(child: Text("No Image found"),);
    }
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
