import 'package:flutter/material.dart';
import 'widget/home.dart';

void main() => runApp(new AnimeApp());

class AnimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Anime',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Animes'),
    );
  }
}