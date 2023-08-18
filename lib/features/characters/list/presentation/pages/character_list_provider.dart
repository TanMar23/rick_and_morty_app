import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di/injector.dart';
import '../cubit/character_list_cubit.dart';
import 'character_list_page.dart';

class CharacterListProvider extends StatelessWidget {
  const CharacterListProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterListCubit>(
      create: (context) => CharacterListCubit(
        rickAndMortyRepository: injector.get(),
        rickAndMortyFavoriteUseCases: injector.get(),
      ),
      child: const CharacterListPage(),
    );
  }
}
