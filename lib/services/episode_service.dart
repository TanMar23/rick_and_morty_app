import 'package:dio/dio.dart';
import '../models/episode.dart';

class EpisodesService {
  final Dio dio;
  EpisodesService({required this.dio});

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
      throw Exception(
          'Something went wrong fetching episodes: ${response.statusCode}');
    } catch (e) {
      throw Exception('Something went wrong fetching episodes: $e');
    }
  }
}
