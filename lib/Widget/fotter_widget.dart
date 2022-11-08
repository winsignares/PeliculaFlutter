import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Widget/movie_horizontal.dart';
import 'package:untitled2/models/model_peliculas.dart';
import 'package:untitled2/provider/peliculas_provider.dart';

Widget footer(BuildContext context, PeliculasProvider peliculasprovider) {
    
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.0),
          child:
              Text('Populares', style: Theme.of(context).textTheme.subtitle1),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder(
            stream: peliculasprovider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data as List<ModelPeliculas>,
                  siguientePagina: peliculasprovider.getPopular,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //snapshot.data?.forEach((p) => print(p.title));
              //return Container();
            })
      ],
    ),
  );
}
