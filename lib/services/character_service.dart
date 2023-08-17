import 'package:rick_and_morty_provider/models/character.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

class CharacterService {
  final Dio dio;
  CharacterService({required this.dio});

  Future<List<Character>> getCharacters({
    required int page,
  }) async {
    try {
      final response =
          await dio.get('https://rickandmortyapi.com/api/character?page=$page');

      if (response.statusCode == 200) {
        List<dynamic> json = response.data['results'];
        List<Character> characters =
            json.map((item) => Character.fromJson(item)).toList();
        return characters;
      } else {
        throw Exception('Error fetching characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }

  Future<List<Character>> getCharactersByIds({
    required List<String> ids,
  }) async {
    try {
      final response = await dio
          .get('https://rickandmortyapi.com/api/character/${ids.join(",")}');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data is List) {
          List<Character> characters =
              data.map((item) => Character.fromJson(item)).toList();
          return characters;
        } else if (data is Map) {
          Map<String, dynamic> characterMap = Map<String, dynamic>.from(data);
          List<Character> characters = [Character.fromJson(characterMap)];
          return characters;
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

  // Future<List<Character>> getCharactersByStatus({
  //   required int page,
  //   required Status status,
  // }) async {
  //   try {
  //     final response = await dio.get(
  //         'https://rickandmortyapi.com/api/character?page=$page&status=unknown');

  //     if (response.statusCode == 200) {
  //       List<dynamic> json = response.data['results'];
  //       // List<dynamic> json = response.data;
  //       print(json);
  //       List<Character> characters =
  //           json.map((item) => Character.fromJson(item)).toList();
  //       return characters;
  //     } else {
  //       throw Exception(
  //           'Error fetching characters by status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching characters by status: $e');
  //   }
  // }
}
