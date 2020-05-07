import 'dart:io';

import 'package:flutter/services.dart';

class Utils {
  static Future<bool> checkResourceExists(String url) async {
    final httpClient = HttpClient();
    final Uri resolved = Uri.base.resolve(url);
    final HttpClientRequest request = await httpClient.getUrl(resolved);
    final HttpClientResponse response = await request.close();
    return response.statusCode != HttpStatus.ok;
  }

  static String formatLikeCount(int number, {int floorValue = 1000}) {
    return number > floorValue ? "${number ~/ 1000} k" : number.toString();
  }

  static String format(Duration d) {
    final startSub = d.inHours > 0 ? 0 : 2;
    return d.toString().substring(startSub, 7);
  }

  static void enableSystemUiOverlays(bool enabled) {
    if (Platform.isAndroid) {
      if (enabled) {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
      } else {
        SystemChrome.setEnabledSystemUIOverlays([]);
      }
    }
  }
}
