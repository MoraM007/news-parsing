import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappjson/bloc/article_bloc.dart';
import 'package:flutterappjson/repository/article_repo.dart';
import 'package:flutterappjson/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        builder: (context) => ArticleBloc(repository: ArticleRepoImp()),
        child: HomePage(),
      ),
    );
  }
}

