import 'package:dio/dio.dart';

import '../models/episode.dart';

class EpisodesService {
  final dio = Dio();

  Future<List<Episode>> getEpisodesByCharacter({
    required String getEpisodesList,
  }) async {
    try {
      final response = await dio
          .get('https://rickandmortyapi.com/api/episode/$getEpisodesList');

      if (response.statusCode == 200) {
        List<dynamic> json = response.data;
        List<Episode> episodes =
            json.map((item) => Episode.fromJson(item)).toList();
        return episodes;
      }
      throw 'Something went wrong:';
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }
}
