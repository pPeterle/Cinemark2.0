class Trailer {
  String type;
  String url;
  String embeddedUrl;

  Trailer({required this.type, required this.url, required this.embeddedUrl});

  factory Trailer.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    final url = json['url'];
    final embeddedUrl = json['embeddedUrl'];

    return Trailer(type: type, url: url, embeddedUrl: embeddedUrl);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    data['embeddedUrl'] = embeddedUrl;
    return data;
  }
}
