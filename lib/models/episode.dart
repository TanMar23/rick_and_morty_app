class Episode {
  const Episode({
    required this.id,
    required this.name,
    required this.episodeInfo,
    required this.airDate,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json['id'],
        name: json['name'],
        episodeInfo: json['episode'],
        airDate: json['air_date'],
      );

  final int id;
  final String name;
  final String episodeInfo;
  final String airDate;
}
