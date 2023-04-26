import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/provider/character_provider.dart';
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
    return ChangeNotifierProvider<CharacterProvider>(
      create: (BuildContext context) => CharacterProvider(favList),
      child: MaterialApp(
        title: 'Rick and Morty with Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(32, 35, 40, 1),
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
