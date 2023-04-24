import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/provider/character_provider.dart';

import '../models/character.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<CharacterProvider>(context, listen: false).getCharacters();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(0.2),
      body: Consumer<CharacterProvider>(
        builder: (BuildContext context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }

          return ListView.builder(
            itemCount: value.characters.length,
            itemBuilder: ((context, index) {
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
            }),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.character,
    required this.onPressed,
  });

  final Character character;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final CharacterProvider provider = Provider.of<CharacterProvider>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: const Color.fromRGBO(59, 62, 67, 1),
        elevation: 10,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.28,
                  maxHeight: MediaQuery.of(context).size.width * 0.28,
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Image.network(character.image, fit: BoxFit.fill),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        character.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: character.status == 'Alive'
                                    ? Colors.lightGreen
                                    : Colors.red,
                                size: 12,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                character.status,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            character.species.toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        provider.toggleFav(id: character.id.toString());
                      },
                      icon: provider.isFav(character.id.toString())
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
