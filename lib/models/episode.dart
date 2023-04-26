import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  const Episode({
    required this.id,
    required this.name,
    required this.episode,
    required this.airDate,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  final int id;
  final String name;
  final String episode;
  @JsonKey(name: 'air_date')
  final String airDate;
}
