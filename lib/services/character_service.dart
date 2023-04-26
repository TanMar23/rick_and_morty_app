import 'package:rick_and_morty_provider/models/character.dart';
import 'package:dio/dio.dart';

class CharacterService {
  final dio = Dio();

  Future<List<Character>> getCharacters({
    required int page,
  }) async {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character?page=$page');

    if (response.statusCode == 200) {
      List<dynamic> json = response.data['results'];
      List<Character> characters =
          json.map((item) => Character.fromJson(item)).toList();
      return characters;
    }
    throw 'Something went wrong';
  }
}
