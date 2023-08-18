import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_provider/features/characters/favorites/presentation/cubit/favorites_cubit.dart';

import '../../../../../widgets/card_item.dart';
import '../../../../rick_and_morty_api/data/model/character_model.dart';
import '../../../detail/presentation/pages/detail_provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final FavoritesCubit cubit = context.read();
    return Scaffold(
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (BuildContext context, FavoritesState state) {
          print('EMITIENDO NUEVO ESTADO DESDE FAVORITE PAGE (BlocBuilder)');
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
                  }),
                ),
                onToggleFav: () {
                  cubit.toggleFavorite(item.id.toString());
                  print(
                      'EMITIENDO NUEVO ESTADO DESDE FAVORITE PAGE (onToggleFav)');
                },
                isFavorite: cubit.isFav(item.id.toString()) ? true : false,
              );
            }),
          );
        },
      ),
    );
  }
}
