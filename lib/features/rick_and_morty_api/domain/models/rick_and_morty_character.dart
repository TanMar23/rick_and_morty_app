import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';

class PaginatedRickAndMortyCharacters {
  const PaginatedRickAndMortyCharacters({
    required this.next,
    required this.characters,
  });

  final String next;
  final List<CharacterModel> characters;
}
