import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_provider/core/domain/extensions/stream_extensions.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';

import '../../../../../core/presentation/mixins/disposable_cubit.dart';
import '../../../../rick_and_morty_api/domain/rick_and_morty_favorites_usecases.dart';
import '../../../../rick_and_morty_api/domain/rick_and_morty_repository.dart';

part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> with DisposableCubit {
  FavoritesCubit({
    required RickAndMortyRepository rickAndMortyRepository,
    required RickAndMortyFavoriteUseCases rickAndMortyFavoriteUseCases,
  })  : _rickAndMortyFavoriteUseCases = rickAndMortyFavoriteUseCases,
        super(FavoritesState()) {
    _initialize();
  }

  final RickAndMortyFavoriteUseCases _rickAndMortyFavoriteUseCases;

  @override
  Future<void> close() {
    disposeAll();
    return super.close();
  }

  void getFavoritesList({
    required List<String> ids,
  }) async {
    _rickAndMortyFavoriteUseCases
        .getFavoriteCharacters(charactersIds: ids)
        .listen(
          (List<CharacterModel> favCharacters) => emit(
            state.copyWith(
              favoritesList: [
                ...state.favoritesList,
                ...favCharacters,
              ],
            ),
          ),
          onError: (_) {},
          onDone: () => emit(
            state.copyWith(
              isLoading: false,
            ),
          ),
        )
        .dispose(this);
  }

  // void _init({required List<String> ids}) {
  //   emit(state.copyWith(isLoading: true));
  //   if (state.favoritesList.isNotEmpty) {
  //     getFavoritesList(ids: ids);
  //   }
  // }

  Future<void> _initialize() async {
    emit(state.copyWith(isLoading: true));

    try {
      List<String> favoriteIds =
          _rickAndMortyFavoriteUseCases.getFavoritesIds();

      getFavoritesList(ids: favoriteIds);
    } catch (error) {
      emit(state.copyWith(isLoading: false));
    }
  }

// TODO: CHECAR COMO NO REPETIR ESTOS METODOS
  // void toggleFavorite(String id) async {
  //   _rickAndMortyFavoriteUseCases.toggleFavorite(id);
  // }

  void toggleFavorite(String id) async {
    _rickAndMortyFavoriteUseCases.toggleFavorite(id);

    _rickAndMortyFavoriteUseCases
        .getFavoriteCharacters(
      charactersIds: state.favoritesList
          .map((character) => character.id.toString())
          .toList(),
    )
        .listen(
      (List<CharacterModel> favCharacters) {
        emit(state.copyWith(
          favoritesList: favCharacters,
        ));
      },
      onError: (_) {},
      onDone: () {},
    );
    print('EMITIENDO NUEVO ESTADO DESDE FAVORITE CUBIT');
  }

  bool isFav(String id) {
    return _rickAndMortyFavoriteUseCases.isFav(id);
  }
}

@freezed
class FavoritesState with _$FavoritesState {
  factory FavoritesState({
    @Default(false) bool isLoading,
    @Default(<CharacterModel>[]) List<CharacterModel> favoritesList,
  }) = _FavoritesState;
}
