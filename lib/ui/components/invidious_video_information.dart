import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:otube/model/complete_video.dart';
import 'package:otube/ui/components/video/video_description.dart';
import 'package:otube/ui/components/video/video_details.dart';
import 'package:otube/ui/components/video/video_title.dart';

class InvidiousVideoInformation extends StatelessWidget {
  final CompleteVideo video;

  const InvidiousVideoInformation({Key key, @required this.video})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoAssets = [
      VideoTitle(video: video),
      VideoDetails(video: video),
      VideoDescription(video: video)
    ];

    return Container(
      child: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: videoAssets.length * 2 - 1,
          itemBuilder: (context, position) {
            return position % 2 == 0 ? Padding(
              padding: EdgeInsets.all(15),
              child:videoAssets[position ~/ 2],
            ) : Divider(color: Colors.black54, height: 1,);
          },
        ),
      ),
    );
  }
}
