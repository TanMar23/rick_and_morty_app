import 'package:rick_and_morty_provider/models/character.dart';
import 'package:dio/dio.dart';

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
}
