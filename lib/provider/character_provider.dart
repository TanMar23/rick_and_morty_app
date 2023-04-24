import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_provider/models/character.dart';
import 'package:rick_and_morty_provider/services/character_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterService service = CharacterService();
  List<Character> _characters = [];
  List<Character> get characters => _characters;
  bool isLoading = false;
  bool isBottomLoading = false;
  int page = 1;

  void init() {
    isLoading = true;
    notifyListeners();
    getCharacters();
  }

  void getCharacters() async {
    final response = await service.getCharacters(
      page: page,
    );
    _characters = [..._characters, ...response];
    page++;

    isLoading = false;
    isBottomLoading = false;
    notifyListeners();
  }

  void fetchMoreData() {
    isBottomLoading = true;
    notifyListeners();
    getCharacters();
  }

  // Favorites section
  late List<String> _favorites = [];
  List<String> get favorites => _favorites;

  CharacterProvider(List<String> favList) {
    _favorites = favList;
  }

  bool isFav(String id) => _favorites.contains(id.toString());

  void toggleFav({required String id}) async {
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
