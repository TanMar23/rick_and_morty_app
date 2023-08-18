import '../rick_and_morty_api/domain/rick_and_morty_favorites_usecases.dart';

class FavoritesBloc {
  final RickAndMortyFavoriteUseCases _favoriteUseCases;

  FavoritesBloc(this._favoriteUseCases);

  bool isFav(String id) {
    return _favoriteUseCases.isFav(id);
  }

  void toggleFavorite(String id) {
    _favoriteUseCases.toggleFavorite(id);
    // TODO: Añadir  la lógica para notificar a otros cubits si es necesario
  }
}
