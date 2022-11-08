import 'package:flutter/material.dart';
import 'package:untitled2/Widget/card_swiper_widget.dart';
import 'package:untitled2/models/model_peliculas.dart';
import 'package:untitled2/provider/peliculas_provider.dart';
import 'package:untitled2/Widget/fotter_widget.dart';
import 'package:untitled2/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  final peliculasprovider = PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    peliculasprovider.getPopular();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _SwiperTarjetas(),
              footer(context, peliculasprovider)
            ],
          ),
        ));
  }

  Widget _SwiperTarjetas() {
    return FutureBuilder(
      future: peliculasprovider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data as List<ModelPeliculas>);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
