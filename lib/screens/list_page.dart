import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/provider/character_provider.dart';

import '../models/character.dart';
import '../widgets/card_item.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final controller = ScrollController();

  // final provider = getIt<CharacterProvider>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<CharacterProvider>(context, listen: false).init();
        // provider.init();
      },
    );

    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        Provider.of<CharacterProvider>(context, listen: false).fetchMoreData();
        // provider.fetchMoreData();
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
    return Scaffold(
      body: Consumer<CharacterProvider>(
        builder: (BuildContext context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: Provider.of<CharacterProvider>(context).onRefresh,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: value.characters.length + 1,
                itemBuilder: ((context, index) {
                  if (index < value.characters.length) {
                    // final Character item = value.characters[index];
                    final CharacterModel item = value.characters[index];
                    return CardItem(
                      character: item,
                      isFavorite: false,
                      onToggleFav: () {},
                      onPressed: () => Navigator.of(context).push<Character>(
                        MaterialPageRoute<Character>(
                            builder: (BuildContext context) {
                          return DetailPage(character: item);
                        }),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                      ),
                      child: Center(
                        child: value.hasMoreData
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
        },
      ),
    );
  }
}
