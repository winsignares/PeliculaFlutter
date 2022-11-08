import 'package:flutter/material.dart';
import 'package:untitled2/models/Model_Actores.dart';
import 'package:untitled2/models/model_peliculas.dart';
import 'package:untitled2/provider/peliculas_provider.dart';

Widget Actor_Horizontal(BuildContext context, ModelPeliculas Modelpelicula) {
  final peliculaprovider = PeliculasProvider();

  return FutureBuilder(
      future: peliculaprovider.getactors(Modelpelicula.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _listaActoresPageView(snapshot.data as List<ModelActores>);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget _listaActoresPageView(List<ModelActores> actores) {
  return SizedBox(
    height: 200.0,
    child: PageView.builder(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        itemCount: actores.length,
        itemBuilder: (context, i) => _actorTarjeta(actores[i])),
  );
}

Widget _actorTarjeta(ModelActores actor) {
  return Container(
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            image: NetworkImage(actor.getImg()),
            placeholder: AssetImage('assets/no-image.jpg'),
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          actor.name,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}
