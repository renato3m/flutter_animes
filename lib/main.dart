import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new AnimeApp());

class AnimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Anime',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ConnectApi repositorio = new ConnectApi();

  String nomeAnime = "Futuro app de anime";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              nomeAnime,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.check),
          backgroundColor: Colors.lightBlue,
          onPressed: (){

            loadAnimes();

          }
      ),
    );
  }


 /* Função que chama o repositório que nos retornará a resposta da api.
 * Observe que a função possue um "async" isso pq ele vai ser executado assincrono por conta
 * do repositório que tb nos responde de forma assincrona pq temos que esperar a resposta, por isso o "await"
 * antes do "repositorio.loadAnimes()".
 * */
  void loadAnimes() async{

    Map map = await repositorio.loadAnimes();

    print(map);
    print('Nome primeiro anime: ${map['data'][0]['name']}');

    setState(() {
      nomeAnime = map['data'][0]['name'];
    });

  }
}


class ConnectApi{

  final String url = 'http://104.131.18.84/anime/animes';

  Future <Map> loadAnimes() async{

    String apiUrl = url;
    http.Response response = await http.get(apiUrl);

    const JsonDecoder decoder = const JsonDecoder();

    return decoder.convert(response.body);
  }

}