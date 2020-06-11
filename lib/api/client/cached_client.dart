import 'dart:convert';

import 'package:flutter_cache_store/flutter_cache_store.dart';
import 'package:otube/api/client/client.dart';

class CachedClient extends HttpClient {
  CacheStore store;

  Future<CachedClient> init() async {
    store = await CacheStore.getInstance(
        policy: CacheControlPolicy(
            maxCount: 100,
            minAge: Duration(seconds: 0),
            maxAge: Duration(minutes: 15)),
        clearNow: true,
        fetch: super.fetchResponse);
    return this;
  }

  @override
  Future<dynamic> fetchJson(path,
      {Map<String, String> headers,
      Map<String, dynamic> custom,
      flushCache = false}) async {
    return store
        .getFile(path,
            key: path, headers: headers, custom: custom, flushCache: flushCache)
        .then((file) => file.readAsString())
        .then((body) => json.decode(body));
  }

  void flush({List<String> keys}) async {
    if (keys.isNotEmpty) {
      await store.flush(keys);
    } else {
      await store.clearAll();
    }
  }
}
