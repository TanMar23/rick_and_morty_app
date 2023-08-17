import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/main.dart';

import '../models/character.dart';
import '../provider/character_provider.dart';
import '../provider/favorites_provider.dart';
import '../widgets/card_item.dart';
import 'detail_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<FavoritesProvider>(context, listen: false)
            .initFavoritesPage();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CharacterProvider characterProvider = getIt<CharacterProvider>();

    return Scaffold(
      body: Consumer<FavoritesProvider>(
        builder: (BuildContext context, value, child) {
          if (value.favorites.isEmpty) {
            return const Center(child: Text('Aún no has guardado un favorito'));
          }
          return FutureBuilder<List<Character>>(
            future: characterProvider.characterService
                .getCharactersByIds(ids: value.favorites),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No hay personajes favoritos.');
              } else {
                return ListView.builder(
                  itemCount: value.charactersByIds.length,
                  itemBuilder: ((context, index) {
                    final Character item = value.charactersByIds[index];
                    return CardItem(
                      character: item,
                      onPressed: () => Navigator.of(context).push<Character>(
                        MaterialPageRoute<Character>(
                            builder: (BuildContext context) {
                          return DetailPage(character: item);
                        }),
                      ),
                    );
                  }),
                );
              }
            },
          );
        },
      ),
    );
  }
}
