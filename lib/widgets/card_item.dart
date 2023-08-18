import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.character,
    required this.onPressed,
    required this.onToggleFav,
    required this.isFavorite,
  });

  final CharacterModel character;
  final VoidCallback onPressed;
  final VoidCallback onToggleFav;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.25,
                  maxHeight: MediaQuery.of(context).size.width * 0.25,
                ),
                child: Container(
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
                    Image.network(
                      character.image,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
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
                            UiUtils.convertToThreeDigits(
                              id: character.id.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                child: Text(
                                  character.name,
                                  style: Theme.of(context).textTheme.headline2,
                                  overflow: UiUtils.fade,
                                  softWrap: false,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: UiUtils.getStatusColor(
                              status: character.status,
                            ),
                            size: 12,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            character.status.substring(0, 1).toUpperCase() +
                                character.status.substring(1).toLowerCase(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        character.species,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    onToggleFav();
                  },
                  icon: isFavorite
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
        ),
      ),
    );
  }
}
