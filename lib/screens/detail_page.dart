import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../provider/character_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final CharacterProvider provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 43, 51, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              provider.toggleFav(id: character.id.toString());
            },
            icon: provider.isFav(character.id.toString())
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: <Widget>[
                CircleAvatarImg(
                  img: character.image,
                  status: character.status,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 87, 92, 102),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white.withOpacity(0.3),
                //     spreadRadius: 1,
                //     blurRadius: 5,
                //   )
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InfoSection(character: character),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PropertyTitle(title: 'PROPERTIES'),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Species',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  character.species,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Type',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                Text(
                  character.type == '' ? 'N/A' : character.type,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                Text(
                  character.gender,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PropertyTitle extends StatelessWidget {
  const PropertyTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Divider(
                color: Colors.white,
                height: 36,
                indent: 32,
              )),
        ),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: const Divider(
              color: Colors.white,
              height: 36,
              endIndent: 32,
            ),
          ),
        ),
      ],
    );
  }
}

class CircleAvatarImg extends StatelessWidget {
  const CircleAvatarImg({
    super.key,
    required this.img,
    required this.status,
  });

  final String img;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircleAvatar(
          backgroundColor:
              status == 'Alive' ? Colors.lightGreenAccent : Colors.red,
          radius: 113,
          child: CircleAvatar(
            backgroundImage: NetworkImage(img),
            radius: 110,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: status == 'Alive' ? Colors.lightGreen : Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
            ),
            child: Center(
                child: Text(
              status.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
