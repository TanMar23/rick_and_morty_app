import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_provider/core/domain/extensions/stream_extensions.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_repository.dart';

import '../../../../../core/presentation/mixins/disposable_cubit.dart';

part 'character_list_cubit.freezed.dart';

class CharacterListCubit extends Cubit<CharacterListState>
    with DisposableCubit {
  CharacterListCubit({
    required RickAndMortyRepository rickAndMortyRepository,
  })  : _rickAndMortyRepository = rickAndMortyRepository,
        super(CharacterListState()) {
    _init();
  }

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
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(
      hasMoreData: true,
      page: 1,
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
