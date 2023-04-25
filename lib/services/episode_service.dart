import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/episode.dart';

class EpisodesService {
  Future<List<Episode>> getEpisodesByCharacter({
    required String getEpisodesList,
  }) async {
    try {
      final url =
          Uri.parse('https://rickandmortyapi.com/api/episode/$getEpisodesList');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        List<Episode> episodes =
            json.map((item) => Episode.fromJson(item)).toList();
        return episodes;
      }
      throw 'Something went wrong:';
    } catch (e) {
      // Handle error ()
      throw 'Something went wrong: $e';
    }
  }
}
