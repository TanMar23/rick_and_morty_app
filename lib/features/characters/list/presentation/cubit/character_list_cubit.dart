import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_provider/core/domain/extensions/stream_extensions.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_repository.dart';

import '../../../../../core/presentation/mixins/disposable_cubit.dart';
import '../../../../rick_and_morty_api/domain/rick_and_morty_favorites_usecases.dart';

part 'character_list_cubit.freezed.dart';

class CharacterListCubit extends Cubit<CharacterListState>
    with DisposableCubit {
  CharacterListCubit({
    required RickAndMortyRepository rickAndMortyRepository,
    required RickAndMortyFavoriteUseCases rickAndMortyFavoriteUseCases,
  })  : _rickAndMortyFavoriteUseCases = rickAndMortyFavoriteUseCases,
        _rickAndMortyRepository = rickAndMortyRepository,
        super(CharacterListState()) {
    _init();
  }

  final RickAndMortyFavoriteUseCases _rickAndMortyFavoriteUseCases;

  final RickAndMortyRepository _rickAndMortyRepository;

  @override
  Future<void> close() {
    disposeAll();
    return super.close();
  }

  void _init() {
    emit(state.copyWith(isLoading: true));
    getCharacters();
  }

  void getCharacters() {
    _rickAndMortyRepository
        .getCharacters(
          page: state.page,
        )
        .listen(
          (List<CharacterModel> characters) => emit(
            state.copyWith(
              page: state.page! + 1,
              charactersList: [
                ...state.charactersList,
                ...characters,
              ],
            ),
          ),
          onError: (_) {},
          onDone: () => emit(
            state.copyWith(
              isLoading: false,
              isBottomLoading: false,
            ),
          ),
        )
        .dispose(this);
  }

  void fetchMoreData() {
    emit(state.copyWith(isBottomLoading: true));
    if (state.charactersList.length < 20) {
      emit(state.copyWith(hasMoreData: false));
    }
    getCharacters();
    // TODO: FIX MESSAGE END OF PAGE
  }

// //  TODO: NECESITO ESTO ACA?? O solo en cubit de favoritos??
//   Future<void> toggleFavorite(String id) async {
//     await _rickAndMortyFavoriteUseCases.toggleFavorite(id);
//   }

  // void toggleFavorite(String id) async {
  //   await _rickAndMortyFavoriteUseCases.toggleFavorite(id);

  //   // Emit a new state to update the UI
  //   emit(state.copyWith(
  //     charactersList: [...state.charactersList], // Copying the list
  //   ));
  //   print('EMITIENDO UN NUEVO ESTADO DESDE LIST CUBIT');
  //   print({state.charactersList});
  // }

  void toggleFavorite(String id) async {
    await _rickAndMortyFavoriteUseCases.toggleFavorite(id);

    // Emit a new state with a new instance of the list
    emit(state.copyWith(
      charactersList: List.from(state.charactersList),
    ));
  }

//  TODO: NECESITO ESTO ACA?? O solo en cubit de favoritos??
  bool isFav(String id) {
    return _rickAndMortyFavoriteUseCases.isFav(id);
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(
      hasMoreData: true, page: 1,
      // TODO: AUN NECESITO ESTO??
      // _characters.clear();
    ));
    getCharacters();
  }
}

@freezed
class CharacterListState with _$CharacterListState {
  factory CharacterListState({
    @Default(false) bool isLoading,
    @Default(false) bool isBottomLoading,
    @Default(<CharacterModel>[]) List<CharacterModel> charactersList,
    @Default(1) int? page,
    @Default(true) bool hasMoreData,
  }) = _CharacterListState;
}
