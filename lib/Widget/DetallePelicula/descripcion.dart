import 'package:flutter/material.dart';

import 'package:untitled2/models/model_peliculas.dart';

Widget Descripcion(ModelPeliculas peliculas) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        peliculas.overview,
        textAlign: TextAlign.justify,
      ));
}
