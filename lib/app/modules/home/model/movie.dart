import 'images.dart';
import 'rotten_tomatoe.dart';
import 'trailer.dart';

class Movie {
  String id;
  String title;
  String originalTitle;
  String? movieIdUrl;
  String ancineId;
  String countryOrigin;
  int priority;
  String contentRating;
  String duration;
  double rating;
  String synopsis;
  String cast;
  String director;
  String distributor;
  bool inPreSale;
  bool isReexhibition;
  String urlKey;
  bool isPlaying;
  int countIsPlaying;
  String creationDate;
  String city;
  String siteURL;
  String nationalSiteURL;
  List<Image> images;
  List<String> genres;
  List<Trailer> trailers;
  RottenTomatoe? rottenTomatoe;

  Movie(
      {required this.id,
      required this.title,
      required this.originalTitle,
      this.movieIdUrl,
      required this.ancineId,
      required this.countryOrigin,
      required this.priority,
      required this.contentRating,
      required this.duration,
      required this.rating,
      required this.synopsis,
      required this.cast,
      required this.director,
      required this.distributor,
      required this.inPreSale,
      required this.isReexhibition,
      required this.urlKey,
      required this.isPlaying,
      required this.countIsPlaying,
      required this.creationDate,
      required this.city,
      required this.siteURL,
      required this.nationalSiteURL,
      required this.images,
      required this.genres,
      required this.trailers,
      this.rottenTomatoe});

  factory Movie.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    final originalTitle = json['originalTitle'];
    final movieIdUrl = json['movieIdUrl'];
    final ancineId = json['ancineId'];
    final countryOrigin = json['countryOrigin'];
    final priority = json['priority'];
    final contentRating = json['contentRating'];
    final duration = json['duration'];
    final rating = json['rating'];
    final synopsis = json['synopsis'];
    final cast = json['cast'];
    final director = json['director'];
    final distributor = json['distributor'];
    final inPreSale = json['inPreSale'];
    final isReexhibition = json['isReexhibition'];
    final urlKey = json['urlKey'];
    final isPlaying = json['isPlaying'];
    final countIsPlaying = json['countIsPlaying'];
    final creationDate = json['creationDate'];
    final city = json['city'];
    final siteURL = json['siteURL'];
    final nationalSiteURL = json['nationalSiteURL'];
    final images = <Image>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(Image.fromJson(v));
      });
    }
    final genres = json['genres'].cast<String>();
    final trailers = <Trailer>[];
    if (json['trailers'] != null) {
      json['trailers'].forEach((v) {
        trailers.add(Trailer.fromJson(v));
      });
    }
    // final rottenTomatoe = json['rottenTomatoe'] != null
    //     ? RottenTomatoe.fromJson(json['rottenTomatoe'])
    //     : null;

    return Movie(
      id: id,
      title: title,
      originalTitle: originalTitle,
      ancineId: ancineId,
      countryOrigin: countryOrigin,
      priority: priority,
      contentRating: contentRating,
      duration: duration,
      rating: rating,
      synopsis: synopsis,
      cast: cast,
      director: director,
      distributor: distributor,
      inPreSale: inPreSale,
      isReexhibition: isReexhibition,
      urlKey: urlKey,
      isPlaying: isPlaying,
      countIsPlaying: countIsPlaying,
      creationDate: creationDate,
      city: city,
      siteURL: siteURL,
      nationalSiteURL: nationalSiteURL,
      images: images,
      genres: genres,
      trailers: trailers,
      movieIdUrl: movieIdUrl,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['originalTitle'] = originalTitle;
    data['movieIdUrl'] = movieIdUrl;
    data['ancineId'] = ancineId;
    data['countryOrigin'] = countryOrigin;
    data['priority'] = priority;
    data['contentRating'] = contentRating;
    data['duration'] = duration;
    data['rating'] = rating;
    data['synopsis'] = synopsis;
    data['cast'] = cast;
    data['director'] = director;
    data['distributor'] = distributor;
    data['inPreSale'] = inPreSale;
    data['isReexhibition'] = isReexhibition;
    data['urlKey'] = urlKey;
    data['isPlaying'] = isPlaying;
    data['countIsPlaying'] = countIsPlaying;
    data['creationDate'] = creationDate;
    data['city'] = city;
    data['siteURL'] = siteURL;
    data['nationalSiteURL'] = nationalSiteURL;
    data['images'] = images.map((v) => v.toJson()).toList();
    data['genres'] = genres;
    data['trailers'] = trailers.map((v) => v.toJson()).toList();
    data['rottenTomatoe'] = rottenTomatoe?.toJson();
    return data;
  }
}
