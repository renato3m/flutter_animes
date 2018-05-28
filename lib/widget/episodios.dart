import 'package:flutter/material.dart';
import '../conection/api.dart';


class EpisodiosPage extends StatefulWidget {
  @override
  _EpisodiosPageState createState() => new _EpisodiosPageState();
}

class _EpisodiosPageState extends State<EpisodiosPage> {

  ConnectApi repositorio = new ConnectApi();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Text("Favoritos")
      ),
    );
  }

  void loadEpisodios() async{

    Map map = await repositorio.loadEpisodios("1");

    setState(() {
      print(map['data']['episodios']);
    });

  }
}