import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  const EpisodeModel({
    required this.id,
    required this.name,
    required this.episode,
    required this.airDate,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);

  final int id;
  final String name;
  final String episode;
  @JsonKey(name: 'air_date')
  final String airDate;
}
