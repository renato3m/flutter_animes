import 'package:flutter/material.dart';
import '../conection/api.dart';


class EpisodiosPage extends StatefulWidget {
  EpisodiosPage({Key key, this.title}) : super (key: key);
  final String title;


  @override
  _EpisodiosPageState createState() => new _EpisodiosPageState();
}

class _EpisodiosPageState extends State<EpisodiosPage> {

  List listEpisodio = new List();

  ConnectApi repositorio = new ConnectApi();


  @override
  Widget build(BuildContext context) {
    loadEpisodios();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          _bildList(),
          new Center(
            child: new RaisedButton.icon(
              onPressed: () {Navigator.pop(context);},
              label: new Text("Voltar"),
              icon: new Icon(Icons.arrow_back),
            )
          ),
        ],
      ),
    );
  }

  void loadEpisodios() async{

    Map map = await repositorio.loadEpisodios("1");

    setState(() {
      listEpisodio = map['data']['episodios'];
    });

  }

  Widget _bildList() {
    ListView listView = new ListView.builder(
        itemCount: listEpisodio.length,
        itemBuilder: (context, index){
          Map ep = listEpisodio[index];

          return listTile(ep);
        }
    );

    return new Flexible(
        child: listView
    );
  }

 ListTile listTile(ep){
 return new ListTile(
     title: new Text(ep['title']),
   );
 }
}