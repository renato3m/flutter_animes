import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ConnectApi{

  final String url = 'http://104.131.18.84';

  Future <Map> loadAnimes() async{

    String apiUrl = '$url/anime/animes';
    http.Response response = await http.get(apiUrl);

    const JsonDecoder decoder = const JsonDecoder();

    return decoder.convert(response.body);
  }

  Future <Map> loadEpisodios(String id) async{

    String apiUrl = '$url/anime/episodios/$id/0';
    http.Response response = await http.get(apiUrl);

    const JsonDecoder decoder = const JsonDecoder();

    return decoder.convert(response.body);
  }

}