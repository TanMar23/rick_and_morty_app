import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_repository.dart';

class CharacterProvider extends ChangeNotifier {
  // CharacterProvider({required this.characterService});
  CharacterProvider({
    required rickAndMortyRepository,
  }) : _rickAndMortyRepository = rickAndMortyRepository;

  // final CharacterService characterService;
  final RickAndMortyRepository _rickAndMortyRepository;

  // List<Character> _characters = [];
  List<CharacterModel> _characters = [];

  // List<Character> get characters => _characters;
  List<CharacterModel> get characters => _characters;

  bool isLoading = false;
  bool isBottomLoading = false;
  bool hasMoreData = true;
  int page = 1;

  void init() {
    isLoading = true;
    notifyListeners();
    // getCharacters();
  }

  // void getCharacters() async {
  //   final characterList = await _rickAndMortyRepository.getCharacters(
  //     page: page,
  //   );

  //   if (characterList.length < 20) {
  //     hasMoreData = false;
  //   }
  //   _characters = [..._characters, ...characterList];
  //   page++;

  //   isLoading = false;
  //   isBottomLoading = false;
  //   notifyListeners();
  // }

  void fetchMoreData() {
    isBottomLoading = true;
    notifyListeners();
    // getCharacters();
  }

  Future<void> onRefresh() async {
    hasMoreData = true;
    page = 1;
    _characters.clear();
    notifyListeners();

    // getCharacters();
  }
}
