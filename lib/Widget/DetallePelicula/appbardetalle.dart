import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/model_peliculas.dart';

Widget crearAppbar(ModelPeliculas pelicula) {
  return SliverAppBar(
    elevation: 2.0,
    backgroundColor: Colors.indigoAccent,
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        pelicula.title,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      background: FadeInImage(
          image: NetworkImage(pelicula.getbackgroundImg()),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover),
    ),
  );
}
