import 'package:flutter/material.dart';

import '../models/episode.dart';
import '../services/episode_service.dart';

class DetailProvider extends ChangeNotifier {
  final EpisodesService episodeService = EpisodesService();
  List<Episode> _episodes = [];
  List<Episode> get episodes => _episodes;
  bool isLoadingEpisodes = false;

  void initDetailPage({required List<String> episodesList}) {
    final List<String> episodesPerCharacter =
        episodesList.map((e) => e).toList();

    String getEpisodesList() {
      String result = '';
      for (var i = 0; i != episodesPerCharacter.length; i++) {
        String dt = episodesPerCharacter[i];
        dt = dt.substring(40);
        result = '$result$dt,';
      }
      return result;
    }

    isLoadingEpisodes = true;
    getEpisodes(getEpisodesList: getEpisodesList());
    notifyListeners();
  }

  void getEpisodes({required String getEpisodesList}) async {
    final episodesList = await episodeService.getEpisodesByCharacter(
      getEpisodesList: getEpisodesList,
    );

    _episodes = episodesList;

    isLoadingEpisodes = false;
    notifyListeners();
  }
}
