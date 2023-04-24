class Character {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        image: json['image'],
      );

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
}



// {
//     "id": 1,
//     "name": "Rick Sanchez",
//     "status": "Alive",
//     "species": "Human",
//     "type": "",
//     "gender": "Male",
//     "origin": {
//         "name": "Earth (C-137)",
//         "url": "https://rickandmortyapi.com/api/location/1"
//     },
//     "location": {
//         "name": "Citadel of Ricks",
//         "url": "https://rickandmortyapi.com/api/location/3"
//     },
//     "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
//     "episode": [
//         "https://rickandmortyapi.com/api/episode/1",
//         "https://rickandmortyapi.com/api/episode/2",
//     ],
//     "url": "https://rickandmortyapi.com/api/character/1",
//     "created": "2017-11-04T18:48:46.250Z"
// }