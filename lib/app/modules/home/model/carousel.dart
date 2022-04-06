import 'package:cinemark_2/app/modules/home/model/movie.dart';

class Carousel {
  String id;
  String name;
  String carouselSlug;
  int priority;
  String type;
  bool hasLink;
  List<Movie> events;

  Carousel(
      {required this.id,
      required this.name,
      required this.carouselSlug,
      required this.priority,
      required this.type,
      required this.hasLink,
      required this.events});

  factory Carousel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final carouselSlug = json['carouselSlug'];
    final priority = json['priority'];
    final type = json['type'];
    final hasLink = json['hasLink'];
    final events = <Movie>[];
    if (json['events'] != null) {
      json['events'].forEach((v) {
        events.add(Movie.fromJson(v));
      });
    }

    return Carousel(
        id: id,
        name: name,
        carouselSlug: carouselSlug,
        priority: priority,
        type: type,
        hasLink: hasLink,
        events: events);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['carouselSlug'] = carouselSlug;
    data['priority'] = priority;
    data['type'] = type;
    data['hasLink'] = hasLink;
    data['events'] = events.map((v) => v.toJson()).toList();

    return data;
  }
}
