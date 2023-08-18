import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/favorites/core_favorites_cubit.dart';
import '../../../../../widgets/card_item.dart';
import '../../../../rick_and_morty_api/data/model/character_model.dart';
import '../../../detail/presentation/pages/detail_provider.dart';
import '../cubit/character_list_cubit.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({
    super.key,
  });

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final controller = ScrollController();

  @override
  void initState() {
    late CharacterListCubit characterListCubit;

    super.initState();
    characterListCubit = context.read<CharacterListCubit>();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        characterListCubit.fetchMoreData();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CoreFavoritesCubit cubit = context.read();

    return BlocBuilder<CharacterListCubit, CharacterListState>(
        builder: (BuildContext context, CharacterListState state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          shrinkWrap: true,
          controller: controller,
          itemCount: state.charactersList.length + 1,
          itemBuilder: ((context, index) {
            if (index < state.charactersList.length) {
              final CharacterModel item = state.charactersList[index];
              return BlocBuilder<CoreFavoritesCubit, CoreFavoritesState>(
                builder: (context, state) {
                  return CardItem(
                    character: item,
                    onPressed: () => Navigator.of(context).push<CharacterModel>(
                      MaterialPageRoute<CharacterModel>(
                          builder: (BuildContext context) {
                        return DetailProvider(character: item);
                      }),
                    ),
                    isFavorite: cubit.isFav(item.id.toString()),
                    onToggleFav: () {
                      cubit.toggleFavorite(item.id.toString());
                    },
                  );
                },
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                ),
                child: Center(
                  child: state.hasMoreData
                      ? const CircularProgressIndicator()
                      : const Text(
                          'No more items to load',
                        ),
                ),
              );
            }
          }),
        ),
      );
    });
  }
}
