import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/rick_and_morty_api/domain/rick_and_morty_favorites_usecases.dart';

part 'core_favorites_cubit.freezed.dart';

class CoreFavoritesCubit extends Cubit<CoreFavoritesState> {
  CoreFavoritesCubit({
    required RickAndMortyFavoriteUseCases rickAndMortyFavoriteUseCases,
  })  : _rickAndMortyFavoriteUseCases = rickAndMortyFavoriteUseCases,
        super(CoreFavoritesState());

  final RickAndMortyFavoriteUseCases _rickAndMortyFavoriteUseCases;

  void toggleFavorite(String id) async {
    await _rickAndMortyFavoriteUseCases.toggleFavorite(id);
    if (state.favoriteIds.contains(id)) {
      List<String> newState = [...state.favoriteIds];
      newState.remove(id);
      emit(state.copyWith(favoriteIds: newState));
    } else {
      List<String> newState = [...state.favoriteIds, id];
      emit(state.copyWith(favoriteIds: newState));
    }
  }

  bool isFav(String id) {
    return _rickAndMortyFavoriteUseCases.isFav(id);
  }
}

@freezed
class CoreFavoritesState with _$CoreFavoritesState {
  factory CoreFavoritesState({
    @Default(false) bool isLoading,
    @Default(<String>[]) List<String> favoriteIds,
  }) = _CoreFavoritesState;
}
