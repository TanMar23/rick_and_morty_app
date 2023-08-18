import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final CharacterListCubit cubit = context.read();

    return BlocBuilder<CharacterListCubit, CharacterListState>(
        builder: (BuildContext context, CharacterListState state) {
      print('EMITIENDO NUEVO ESTADO DESDE BLOCBUILDER');
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return RefreshIndicator(
        onRefresh: cubit.onRefresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            shrinkWrap: true,
            controller: controller,
            itemCount: state.charactersList.length + 1,
            itemBuilder: ((context, index) {
              if (index < state.charactersList.length) {
                final CharacterModel item = state.charactersList[index];
                return CardItem(
                  character: item,
                  onPressed: () => Navigator.of(context).push<CharacterModel>(
                    MaterialPageRoute<CharacterModel>(
                        builder: (BuildContext context) {
                      return DetailProvider(character: item);
                    }),
                  ),
                  isFavorite: cubit.isFav(item.id.toString()),
                  // onToggleFav: () => cubit.toggleFavorite(item.id.toString()),
                  onToggleFav: () {
                    cubit.toggleFavorite(item.id.toString());
                    print(
                        'EMITIENDO NUEVO ESTADO DESDE onToggleFav DE BLOCBUILDER');
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
        ),
      );
    });
  }
}
