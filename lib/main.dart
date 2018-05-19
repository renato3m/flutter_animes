import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'conection/api.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List listAnimes = new List();

  ConnectApi repositorio = new ConnectApi();

  //String nomeAnime = "Futuro app de anime";

  @override
  Widget build(BuildContext context) {
    
    loadAnimes(); //chama o metodo que carrega a lista de animes.

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _bildList()
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

    //print(map);
    //print('Nome primeiro anime: ${map['data'][0]['name']}');

    setState(() {
      listAnimes = map['data'];
    });

  }

/*
* Cria uma listView pegando cada elemento a lista, chamando no retorno um metodo que monda os cards
*/
  Widget _bildList() {
    ListView listView = new ListView.builder(
      itemCount: listAnimes.length,
      itemBuilder: (context, index){
        Map anime = listAnimes[index];

        return _layoutCarAnime(anime);
      }
    );

    return new Flexible(
      child: listView
    );
  }

  Widget _layoutCarAnime(anime){
    return new Container(
      margin: const EdgeInsets.all(0.5),
      child: new Card(
        child: listTile(anime),
      )
    );
  }

  ListTile listTile(anime){
    return new ListTile(
      leading: new Icon(Icons.broken_image, size: 50.0,),
      title: new Text(anime['name']),
    );
  }

}
