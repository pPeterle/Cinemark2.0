class City {
  String id;
  String name;
  String uf;
  String state;
  String urlKey;
  String timeZone;

  City({
    required this.id,
    required this.name,
    required this.uf,
    required this.state,
    required this.urlKey,
    required this.timeZone,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final uf = json['uf'];
    final state = json['state'];
    final urlKey = json['urlKey'];
    final timeZone = json['timeZone'];
    return City(
      id: id,
      name: name,
      uf: uf,
      state: state,
      urlKey: urlKey,
      timeZone: timeZone,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['uf'] = uf;
    data['state'] = state;
    data['urlKey'] = urlKey;
    data['timeZone'] = timeZone;
    return data;
  }
}
