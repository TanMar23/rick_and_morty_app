import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_provider/di/injector.dart';
import 'package:rick_and_morty_provider/features/characters/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:rick_and_morty_provider/features/characters/favorites/presentation/pages/favorites_page.dart';

class FavoritesProvider extends StatelessWidget {
  const FavoritesProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (context) => FavoritesCubit(
        rickAndMortyFavoriteUseCases: injector.get(),
        rickAndMortyRepository: injector.get(),
      ),
      child: const FavoritesPage(),
    );
  }
}
