import '../data/model/character_model.dart';
import '../data/model/episode_model.dart';

abstract class RickAndMortyRepository {
  Stream<List<CharacterModel>> getCharacters({
    int? page,
  });

  Stream<List<CharacterModel>> getCharactersByIds({
    required List<String> ids,
  });

  Stream<List<EpisodeModel>> getEpisodesByCharacter({
    required String episodesIds,
  });
}
