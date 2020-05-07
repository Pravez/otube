import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otube/ui/home/home_screen.dart';
import 'package:otube/ui/trending/trending_screen.dart';
import 'package:otube/ui/video/video_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTube',
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        Trending.route: (_) => Trending(),
        VideoScreen.route: (context) =>
            VideoScreen(arguments: ModalRoute.of(context).settings.arguments)
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
