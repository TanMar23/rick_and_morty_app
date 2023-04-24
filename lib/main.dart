import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/provider/character_provider.dart';

import 'screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CharacterProvider>(
      create: (BuildContext context) => CharacterProvider(),
      child: MaterialApp(
        title: 'Rick and Morty with Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(39, 43, 51, 1),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
