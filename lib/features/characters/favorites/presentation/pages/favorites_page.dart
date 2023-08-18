import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_provider/core/presentation/favorites/core_favorites_cubit.dart';
import 'package:rick_and_morty_provider/features/characters/favorites/presentation/cubit/favorites_cubit.dart';

import '../../../../../widgets/card_item.dart';
import '../../../../rick_and_morty_api/data/model/character_model.dart';
import '../../../detail/presentation/pages/detail_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreFavoritesCubit, CoreFavoritesState>(
      builder: (context, coreState) {
        return BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.favoritesList.isEmpty) {
              return const Center(
                  child: Text('You haven\'t saved a favorite yet'));
            }
            return ListView.builder(
              itemCount: state.favoritesList.length,
              itemBuilder: ((context, index) {
                final CharacterModel item = state.favoritesList[index];
                return CardItem(
                  character: item,
                  onPressed: () => Navigator.of(context).push<CharacterModel>(
                    MaterialPageRoute<CharacterModel>(
                      builder: (BuildContext context) {
                        return DetailProvider(character: item);
                      },
                    ),
                  ),
                  onToggleFav: () {
                    context
                        .read<CoreFavoritesCubit>()
                        .toggleFavorite(item.id.toString());
                  },
                  isFavorite:
                      coreState.favoriteIds.contains(item.id.toString()),
                );
              }),
            );
          },
        );
      },
    );
  }
}
