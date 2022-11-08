class Peliculas {
  List<ModelPeliculas> items = [];

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final pelicula = new ModelPeliculas.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class ModelPeliculas {
  late String uniqeId;
  late int voteColum;
  late int id;
  late bool video;
  late double voteAverage;
  late String title;
  late double popularity;
  late String posterPath;
  late String originalLanguage;
  late String originalTitle;
  late List<int> genreIds;
  late String overview;
  late String releaseDate;
  late String backdropPath;
  late bool adult;
  late String relaseDate;

  ModelPeliculas(
      this.voteColum,
      this.id,
      this.video,
      this.voteAverage,
      this.popularity,
      this.title,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.overview,
      this.releaseDate,
      this.backdropPath,
      this.adult,
      this.relaseDate);

  ModelPeliculas.fromJsonMap(Map<String, dynamic> json) {
    voteColum = json['vote_colum'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    overview = json['overview'];
    releaseDate = json['release_date'];
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    relaseDate = json['relase_date'];
  }
  getPosterImg() {
    if (posterPath == null) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getbackgroundImg() {
    if (backdropPath == null) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
