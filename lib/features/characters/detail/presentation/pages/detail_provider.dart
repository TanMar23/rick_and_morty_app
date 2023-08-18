import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_provider/features/characters/detail/presentation/cubit/detail_cubit.dart';
import 'package:rick_and_morty_provider/features/characters/detail/presentation/pages/detail_page.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';

import '../../../../../di/injector.dart';

class DetailProvider extends StatelessWidget {
  const DetailProvider({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCubit>(
      create: (context) => DetailCubit(
        rickAndMortyRepository: injector.get(),
        character: character,
      ),
      child: DetailPage(
        character: character,
      ),
    );
  }
}
