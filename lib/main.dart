import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/blocs/home/bloc.dart';
import 'package:otube/infrastructure/injection.dart';
import 'package:otube/view/home_screen.dart';

import 'blocs/home/home_bloc.dart';

void main() {
  Injection.setup();

  runApp(OTube());
}

class OTube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'OTube',
        initialRoute: HomeScreen.Route,
        routes: {
          HomeScreen.Route: (context) => Bone(child: HomeScreen()),
          /*Trending.route: (_) => Trending(),
        VideoScreen.route: (context) =>
            VideoScreen(arguments: ModalRoute.of(context).settings.arguments)*/
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class Bone extends StatelessWidget {
  final Widget child;

  const Bone({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Injection.getIt.allReady(),
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Otube"),
              ),
              body: BlocProvider(
                create: (context) => HomeBloc()..add(HomeVideosFetched()),
                child: HomeScreen(),
              ));
        });
  }
}
