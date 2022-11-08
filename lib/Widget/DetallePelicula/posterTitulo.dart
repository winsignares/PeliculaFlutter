import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/model_peliculas.dart';

Widget posterTitulo(BuildContext context, ModelPeliculas peliculas) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(children: <Widget>[
      Hero(
        tag: peliculas.uniqeId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage(peliculas.getPosterImg()),
            height: 150.0,
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Flexible(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            peliculas.title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
            Text(peliculas.originalTitle,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis),
            Row(
              children: <Widget>[
              Icon(Icons.star_border),
              Text(peliculas.voteAverage.toString(),
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          )
        ],
      ))
    ]),
  );
}
