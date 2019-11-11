import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otube/bloc/invidious_query_bloc.dart';
import 'package:otube/service/invidious_query_type.dart';
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
        child: VideoList(type: InvidiousQueryType.TOP),
      ),
    );
  }
}
