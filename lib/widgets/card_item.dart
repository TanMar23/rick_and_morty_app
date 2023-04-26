import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../provider/character_provider.dart';

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
                  child: Stack(children: [
                    Image.network(character.image, fit: BoxFit.fill),
                    Positioned(
                      bottom: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 4,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(59, 62, 67, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${get3DigitsId(id: character.id.toString())}',
                          ),
                        ),
                      ),
                    ),
                  ]),
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
                          style: Theme.of(context).textTheme.headline2,
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            character.species,
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

get3DigitsId({required String id}) {
  if (id.characters.length == 1) {
    return '00$id';
  } else if (id.characters.length == 2) {
    return '0$id';
  } else {
    return id;
  }
}
