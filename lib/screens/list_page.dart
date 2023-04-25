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
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'No more items to load',
                              style: TextStyle(color: Colors.white),
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
                  // TODO: Fix this to make it responsive?
                  height: 130,
                  width: 130,
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                      child: Flexible(
                        child: Text(
                          character.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: getStatusColor(status: character.status),
                                size: 12,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                character.status.substring(0, 1).toUpperCase() +
                                    character.status.substring(1).toLowerCase(),
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '# ${character.id.toString()}',
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            character.species,
                            style: TextStyle(color: Colors.grey.shade300),
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: IconButton(
                      splashRadius: 20,
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

Color getStatusColor({required String status}) {
  Color colorStatus;
  switch (status) {
    case 'Alive':
      colorStatus = const Color(0xFF55CB44);
      break;
    case 'Dead':
      colorStatus = Colors.red;
      break;
    case 'unknown':
      colorStatus = const Color(0xFFFF9800);
      break;
    default:
      colorStatus = Colors.black;
  }
  return colorStatus;
}
