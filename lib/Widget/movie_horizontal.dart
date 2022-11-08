import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:untitled2/models/model_peliculas.dart';

class MovieHorizontal extends StatelessWidget {
  final List<ModelPeliculas> peliculas;
  final Function siguientePagina;

  MovieHorizontal({required this.peliculas, required this.siguientePagina});

  final _pageControlle = new PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    //miramos si llego al final de la pantalla y mandamos a cargar las demas peliculas
    _pageControlle.addListener(() {
      if (_pageControlle.position.pixels >=_pageControlle.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.20,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageControlle,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _Tarjetas(context, peliculas[i]);
        },
        //children: _tarjetas(context),
      ),
    );
  }

  Widget _Tarjetas(BuildContext context, ModelPeliculas pelicula) {
    pelicula.uniqeId = '${pelicula.id}-poster';

    final tarjeta = Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqeId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 130.0,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ));
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
/*
  List<Widget> _tarjetas(BuildContext context) {
    //const tarjeta = Container();
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:  FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 140.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
              ],
      )
      );
    }).toList();
  }
}*/
