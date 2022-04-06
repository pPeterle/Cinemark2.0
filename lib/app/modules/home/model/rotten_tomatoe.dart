class RottenTomatoe {
  String id;
  String criticsRating;
  String criticsScore;
  String audienceRating;
  String audienceScore;
  String originalUrl;

  RottenTomatoe(
      {required this.id,
      required this.criticsRating,
      required this.criticsScore,
      required this.audienceRating,
      required this.audienceScore,
      required this.originalUrl});

  factory RottenTomatoe.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final criticsRating = json['criticsRating'];
    final criticsScore = json['criticsScore'];
    final audienceRating = json['audienceRating'];
    final audienceScore = json['audienceScore'];
    final originalUrl = json['originalUrl'];

    return RottenTomatoe(
        id: id,
        criticsRating: criticsRating,
        criticsScore: criticsScore,
        audienceRating: audienceRating,
        audienceScore: audienceScore,
        originalUrl: originalUrl);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['criticsRating'] = criticsRating;
    data['criticsScore'] = criticsScore;
    data['audienceRating'] = audienceRating;
    data['audienceScore'] = audienceScore;
    data['originalUrl'] = originalUrl;
    return data;
  }
}
