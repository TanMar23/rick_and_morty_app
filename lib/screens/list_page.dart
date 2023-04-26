import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<CharacterProvider>(context, listen: false).init();
      },
    );

    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        Provider.of<CharacterProvider>(context, listen: false).fetchMoreData();
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
            child: ListView.builder(
              controller: controller,
              itemCount: value.characters.length + 1,
              itemBuilder: ((context, index) {
                if (index < value.characters.length) {
                  final Character item = value.characters[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: CardItem(
                      character: item,
                      onPressed: () => Navigator.of(context).push<Character>(
                        MaterialPageRoute<Character>(
                            builder: (BuildContext context) {
                          return DetailPage(character: item);
                        }),
                      ),
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
          );
        },
      ),
    );
  }
}
