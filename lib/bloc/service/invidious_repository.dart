import 'dart:async';

import 'package:otube/model/complete_video.dart';
import 'package:otube/model/video_comments.dart';
import 'package:otube/model/video_list_result.dart';

import 'invidious_cache.dart';
import 'invidious_client.dart';

class InvidiousRepository {
  static final InvidiousClient client = InvidiousClient();
  static final InvidiousCache cache = InvidiousCache();

  static Future<VideoListResult> _getList(String category) async {
    if (cache.containsAndIsRelevant(category)) {
      return cache.get(category);
    } else {
      final result = await client.top();
      cache.set(category, result);
      return result;
    }
  }

  static Future<VideoListResult> getTop() async => _getList("top");

  static Future<VideoListResult> getTrending() async => _getList("trending");

  static Future<CompleteVideo> getVideo(String id) async => await client.video(id);
  static Future<VideoComments> getComments(String id) async => await client.comments(id);
}
