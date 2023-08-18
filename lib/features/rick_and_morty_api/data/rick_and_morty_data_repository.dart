import 'package:dio/dio.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/episode_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_repository.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/remote/rick_and_morty_api.dart';

class RickAndMortyDataRepository
    with RickAndMortyApi
    implements RickAndMortyRepository {
  RickAndMortyDataRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Stream<List<CharacterModel>> getCharacters({
    int? page,
  }) async* {
    try {
      final response =
          await dio.get(endpointParse('character'), queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        List<dynamic> json = response.data['results'];
        List<CharacterModel> characters =
            json.map((item) => CharacterModel.fromJson(item)).toList();
        yield characters;
      } else {
        throw Exception('Error fetching characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }

  @override
  Stream<List<CharacterModel>> getCharactersByIds({
    required List<String> ids,
  }) async* {
    try {
      if (ids.isEmpty) {
        yield [];
        return;
      }
      final response =
          await dio.get(endpointParse('character/${ids.join(",")}'));

      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data is List) {
          List<CharacterModel> characters =
              data.map((item) => CharacterModel.fromJson(item)).toList();
          yield characters;
        } else if (data is Map) {
          Map<String, dynamic> characterMap = Map<String, dynamic>.from(data);
          List<CharacterModel> characters = [
            CharacterModel.fromJson(characterMap)
          ];
          yield characters;
        } else {
          throw Exception('Error parsing characters data');
        }
      } else {
        throw Exception(
            'Error fetching characters by ids: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching characters by ids: $e');
    }
  }

  @override
  Stream<List<EpisodeModel>> getEpisodesByCharacter({
    required String episodesIds,
  }) async* {
    try {
      final response = await dio.get(endpointParse('episode/$episodesIds'));
      if (response.statusCode == 200) {
        List<dynamic> json = response.data;
        List<EpisodeModel> episodes =
            json.map((item) => EpisodeModel.fromJson(item)).toList();
        yield episodes;
      } else {
        throw Exception(
            'Something went wrong fetching episodes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Something went wrong fetching episodes: $e');
    }
  }
}
