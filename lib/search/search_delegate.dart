import 'package:flutter/material.dart';
import 'package:untitled2/models/model_peliculas.dart';
import 'package:untitled2/provider/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = PeliculasProvider();
  late String seleccion;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // acciones de nuestro AppBar

    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
        onPressed: (() {
          close(context, null);
        }),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que se van a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias que aparece cuando las personas escriben
    if (query.isEmpty) {
      return Container();
    }
    print(query);
    return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data as List<ModelPeliculas>;
            print(peliculas);
            return ListView(
              children: peliculas.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: () {
                    close(context, null);
                    pelicula.uniqeId = '';
                    Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
