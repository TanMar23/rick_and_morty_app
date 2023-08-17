import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/provider/character_provider.dart';
import 'package:rick_and_morty_provider/provider/detail_provider.dart';
import 'package:rick_and_morty_provider/provider/favorites_provider.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash_page.dart';
import 'services/character_service.dart';
import 'services/episode_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio());
  // TODO: CLEAN CODE
  // getIt.registerFactory<CharacterService>(
  //     () => CharacterService(dio: getIt<Dio>()));
  getIt
      .registerSingleton<CharacterService>(CharacterService(dio: getIt<Dio>()));

  getIt.registerSingleton<CharacterProvider>(
      CharacterProvider(characterService: getIt<CharacterService>()));

  getIt.registerSingleton<EpisodesService>(EpisodesService(dio: getIt<Dio>()));

  getIt.registerSingleton<DetailProvider>(
      DetailProvider(episodesService: getIt<EpisodesService>()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final favList = sharedPreferences.getStringList('fav_list') ?? <String>[];

  setupLocator();

  getIt.registerSingleton<FavoritesProvider>(
      FavoritesProvider(favList, characterService: getIt<CharacterService>()));

  runApp(RickAndMortyApp(
    favList: favList,
  ));
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({
    super.key,
    required this.favList,
  });

  final List<String> favList;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<DetailProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<FavoritesProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CharacterProvider>()),
      ],
      child: ConstrainedApp(
        child: MaterialApp(
          title: 'Rick and Morty with Provider',
          debugShowCheckedModeBanner: false,
          theme: UiUtils.getAppTheme(),
          home: const SplashPage(),
        ),
      ),
    );
  }
}

class ConstrainedApp extends StatelessWidget {
  const ConstrainedApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 936,
            maxWidth: 485,
          ),
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
