import 'dart:convert';

import 'package:rick_and_morty_provider/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  Future<List<Character>> getCharacters({
    required int page,
  }) async {
    // final url = Uri.https('rickandmortyapi.com', '/api/character');
    final url =
        Uri.parse('https://rickandmortyapi.com/api/character?page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body)['results'];
      List<Character> characters =
          json.map((item) => Character.fromJson(item)).toList();
      return characters;
    }
    throw 'Something went wrong';
  }
}
