import 'package:otube/model/video_list_result.dart';
import 'package:otube/utils/pair.dart';

class InvidiousCache {
  final _cache = <String, Pair<DateTime, VideoListResult>>{};

  Duration _cacheTtl = Duration(minutes: 15);

  VideoListResult get(String category) => _cache[category].right;

  void set(String category, VideoListResult list) =>
      _cache[category] = Pair(DateTime.now(), list);

  bool containsAndIsRelevant(String category) =>
      _cache.containsKey(category) &&
      _cache[category].left.isAfter(DateTime.now().subtract(_cacheTtl));

  set maximumDuration(Duration duration) => _cacheTtl = duration;
}
