import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_provider/provider/character_provider.dart';
import 'package:rick_and_morty_provider/provider/detail_provider.dart';
import 'package:rick_and_morty_provider/provider/favorites_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final favList = sharedPreferences.getStringList('fav_list') ?? <String>[];
  runApp(MyApp(
    favList: favList,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.favList,
  });

  final List<String> favList;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider(create: (_) => DetailProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider(favList)),
      ],
      child: MaterialApp(
        title: 'Rick and Morty with Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(32, 35, 40, 1),
          ),
          textTheme: TextTheme(
            headline1: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline2: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            bodyText2: TextStyle(color: Colors.grey.shade300),
            subtitle1: TextStyle(
              color: Colors.grey.shade200,
              fontWeight: FontWeight.w500,
            ),
            subtitle2: const TextStyle(
              color: Colors.grey,
            ),
            labelMedium: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(39, 43, 51, 1),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
