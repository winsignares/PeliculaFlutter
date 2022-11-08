import 'package:flutter/material.dart';
import 'package:untitled2/Widget/DetallePelicula/descripcion.dart';
import 'package:untitled2/models/model_peliculas.dart';
import 'package:untitled2/Widget/DetallePelicula/appbardetalle.dart';
import 'package:untitled2/Widget/DetallePelicula/actor_horizontal.dart';

import '../Widget/DetallePelicula/posterTitulo.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ModelPeliculas peliculas = ModalRoute.of(context)!.settings.arguments as ModelPeliculas;

    return Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[
          crearAppbar(peliculas),
          SliverList(
            delegate: SliverChildListDelegate([
            SizedBox(height: 10.0),
            posterTitulo(context, peliculas),
            Descripcion(peliculas),
            Actor_Horizontal(context, peliculas)
          ]),
        )
      ],
    ));
  }
}
