import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/character.dart';
import '../services/character_service.dart';

class FavoritesProvider extends ChangeNotifier {
  final CharacterService characterService;

  late List<String> _favorites = [];
  List<String> get favorites => _favorites;

  List<Character> _charactersByIds = [];
  List<Character> get charactersByIds => _charactersByIds;

  bool isLoading = false;

  FavoritesProvider(List<String> favList, {required this.characterService}) {
    _favorites = favList;
  }

  bool isFav(String id) => _favorites.contains(id.toString());

  Future<void> toggleFav({required String id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isFav(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }

    sharedPreferences.setStringList('fav_list', _favorites);
    notifyListeners();
  }

  void getCharactersByIds({
    required List<String> ids,
  }) async {
    final charactersByIdsList =
        await characterService.getCharactersByIds(ids: ids);
    _charactersByIds = charactersByIdsList;

    isLoading = false;
    notifyListeners();
  }

  void initFavoritesPage() {
    isLoading = true;
    notifyListeners();
    if (favorites.isEmpty) {
      return;
    }
    getCharactersByIds(ids: favorites);
  }
}
