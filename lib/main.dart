import 'package:flutter/material.dart';
import 'package:otube/ui/OHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OHome(title: 'Flutter Demo Home Page'),
    );
  }
}

