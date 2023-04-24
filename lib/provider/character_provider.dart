import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_provider/models/character.dart';
import 'package:rick_and_morty_provider/services/character_service.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterService service = CharacterService();
  List<Character> _characters = [];
  List<Character> get characters => _characters;
  bool isLoading = false;

  void getCharacters() async {
    isLoading = true;
    notifyListeners();

    final response = await service.getCharacters();
    _characters = response;

    isLoading = false;
    notifyListeners();
  }

  // Favorites section
  final List<String> _favorites = [];
  List<String> get favorites => _favorites;

  bool isFav(String id) => _favorites.contains(id.toString());

  void toggleFav({required String id}) {
    if (isFav(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }

  // void toggleFav(String id) async {
  //   final isFav = _favoriteList.contains(id);
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //   if (isFav) {
  //     _favoriteList.remove(id);
  //   } else {
  //     _favoriteList.add(id);
  //   }

  //   sharedPreferences.setStringList('fav_list', _favoriteList);
  //   notifyListeners();
  // }

  // bool isFav(String id) {
  //   final isFav = _favoriteList.contains(id);
  //   return isFav;
  // }
}
