import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RickAndMortyFavoriteUseCases {
  // ESTE MODELO DEBE SER DE LOS QUE HAY EN DOMAIN?
  Stream<List<CharacterModel>> getFavoriteCharacters({
    required List<String> charactersIds,
  });
  Future<void> toggleFavorite(String id);
  bool isFav(String id);
  List<String> getFavoritesIds();
}

class RickAndMortyFavoriteUseCasesImp implements RickAndMortyFavoriteUseCases {
  RickAndMortyFavoriteUseCasesImp({
    required SharedPreferences sharedPreferences,
    required RickAndMortyRepository remoteRepository,
  })  : _sharedPreferences = sharedPreferences,
        _remoteRepository = remoteRepository {
    _favorites = _sharedPreferences.getStringList('fav_list') ?? [];
  }

  final SharedPreferences _sharedPreferences;
  final RickAndMortyRepository _remoteRepository;

  List<String> get favorites => _favorites;

  late List<String>
      _favorites; // No inicializar aquí, se inicializa en el constructor

  @override
  Stream<List<CharacterModel>> getFavoriteCharacters({
    required List<String> charactersIds,
  }) async* {
    final charactersByIdsList =
        _remoteRepository.getCharactersByIds(ids: charactersIds);
    yield* charactersByIdsList;
  }

  @override
  bool isFav(String id) {
    return _favorites.contains(id.toString());
  }

  @override
  Future<void> toggleFavorite(String id) async {
    if (isFav(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }

    _sharedPreferences.setStringList('fav_list', _favorites);
  }

  @override
  List<String> getFavoritesIds() {
    return favorites;
  }
}
