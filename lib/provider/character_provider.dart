import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_provider/models/character.dart';
import 'package:rick_and_morty_provider/services/character_service.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterService characterService;

  List<Character> _characters = [];
  List<Character> get characters => _characters;
  bool isLoading = false;
  bool isBottomLoading = false;
  bool hasMoreData = true;
  int page = 1;

  CharacterProvider({required this.characterService});

  void init() {
    isLoading = true;
    notifyListeners();
    getCharacters();
  }

  void getCharacters() async {
    final characterList = await characterService.getCharacters(
      page: page,
    );

    if (characterList.length < 20) {
      hasMoreData = false;
    }
    _characters = [..._characters, ...characterList];
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

  Future<void> onRefresh() async {
    hasMoreData = true;
    page = 1;
    _characters.clear();
    notifyListeners();

    getCharacters();
  }
}
