import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  late List<String> _favorites = [];
  List<String> get favorites => _favorites;

  FavoritesProvider(List<String> favList) {
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
}
