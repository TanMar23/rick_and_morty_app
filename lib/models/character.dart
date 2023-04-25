class Character {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.location,
    required this.origin,
    required this.episodesList,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        image: json['image'],
        origin: json['origin']['name'],
        location: json['location']['name'],
        episodesList:
            (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      );

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final String origin;
  final String location;
  final List<String> episodesList;
}
