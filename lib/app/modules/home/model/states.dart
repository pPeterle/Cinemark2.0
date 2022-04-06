import 'city.dart';

class State {
  String name;
  String uf;
  List<City> cities;

  State({required this.name, required this.uf, required this.cities});

  factory State.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final uf = json['uf'];
    final cities = <City>[];
    json['cities'].forEach((c) {
      cities.add(City.fromJson(c));
    });

    return State(name: name, uf: uf, cities: cities);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uf'] = uf;
    data['cities'] = cities.map((v) => v.toJson()).toList();
    return data;
  }
}
