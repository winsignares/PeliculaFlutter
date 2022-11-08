import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:untitled2/models/model_peliculas.dart';
import 'package:untitled2/models/Model_Actores.dart';

class PeliculasProvider {
  String _apikey = "76e77ec00c5cf623948433d17bc2264b";
  String _url = "api.themoviedb.org";
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<ModelPeliculas> _populares = [];

  final _popularesStreamController = StreamController<List<ModelPeliculas>>.broadcast();
  Function(List<ModelPeliculas>) get popularesSink => _popularesStreamController.sink.add;
  Stream<List<ModelPeliculas>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Future<List<ModelPeliculas>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<ModelPeliculas>> getPopular() async {
    if (_cargando) return [];
    _cargando = true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    _populares.addAll(peliculas.items);

    popularesSink(_populares);

    _cargando = false;
    return peliculas.items;
  }

  Future<List<ModelActores>> getactors(String id) async {
    final url = Uri.https(_url, '3/movie/$id/credits',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final actor = new Actor.fromJsonList(decodedData['cast']);

    return actor.items;
  }

  Future<List<ModelPeliculas>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apikey, 'language': _language, 'query': query});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}
