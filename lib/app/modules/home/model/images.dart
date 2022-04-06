enum ImageType { posterHorizontal, posterPortrait }

class Image {
  String url;
  ImageType type;

  Image({required this.url, required this.type});

  factory Image.fromJson(Map<String, dynamic> json) {
    final url = json['url'];
    final type = json['type'] == 'PosterPortrait'
        ? ImageType.posterPortrait
        : ImageType.posterHorizontal;
    return Image(url: url, type: type);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}
