import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/episode_model.dart';

import '../../../../../core/presentation/mixins/disposable_cubit.dart';
import '../../../../rick_and_morty_api/domain/rick_and_morty_favorites_usecases.dart';
import '../../../../rick_and_morty_api/domain/rick_and_morty_repository.dart';
import '../../../../../core/domain/extensions/stream_extensions.dart';

part 'detail_cubit.freezed.dart';

class DetailCubit extends Cubit<DetailState> with DisposableCubit {
  DetailCubit({
    required RickAndMortyRepository rickAndMortyRepository,
    required RickAndMortyFavoriteUseCases rickAndMortyFavoriteUseCases,
    required this.character,
  })  : _rickAndMortyFavoriteUseCases = rickAndMortyFavoriteUseCases,
        _rickAndMortyRepository = rickAndMortyRepository,
        super(DetailState()) {
    _init(episodesList: character.episode);
  }

  final RickAndMortyFavoriteUseCases _rickAndMortyFavoriteUseCases;
  final RickAndMortyRepository _rickAndMortyRepository;

  final CharacterModel character;

  @override
  Future<void> close() {
    disposeAll();
    return super.close();
  }

  void getEpisodes({
    required String getEpisodesList,
  }) async {
    _rickAndMortyRepository
        .getEpisodesByCharacter(episodesIds: getEpisodesList)
        .listen(
          (List<EpisodeModel> episodes) => emit(
            state.copyWith(
              episodesList: [
                ...state.episodesList,
                ...episodes,
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

  void _init({
    required List<String> episodesList,
  }) {
    emit(state.copyWith(isLoading: true));

    final List<String> episodesPerCharacter =
        episodesList.map((e) => e).toList();
    String getEpisodesList() {
      String result = '';
      for (int i = 0; i != episodesPerCharacter.length; i++) {
        String dt = episodesPerCharacter[i];
        dt = dt.substring(40);
        result = '$result$dt,';
      }
      return result;
    }

    getEpisodes(getEpisodesList: getEpisodesList());
  }

// TODO: CHECAR COMO NO REPETIR ESTOS METODOS
  void toggleFavorite(String id) async {
    _rickAndMortyFavoriteUseCases.toggleFavorite(id);
  }

  bool isFav(String id) {
    return _rickAndMortyFavoriteUseCases.isFav(id);
  }
}

@freezed
class DetailState with _$DetailState {
  factory DetailState({
    @Default(false) bool isLoading,
    @Default(<EpisodeModel>[]) List<EpisodeModel> episodesList,
  }) = _DetailState;
}
