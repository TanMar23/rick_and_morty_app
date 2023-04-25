import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../provider/character_provider.dart';
import '../widgets/circle_avatar_img.dart';

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
      backgroundColor: const Color.fromRGBO(32, 35, 41, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              provider.toggleFav(id: character.id.toString());
            },
            icon: provider.isFav(character.id.toString())
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border, color: Colors.grey),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: <Widget>[
                CircleAvatarImg(
                  img: character.image,
                  status: character.status,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(59, 62, 67, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
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
                  const SizedBox(height: 12),
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
        Divider(
          color: Colors.grey.shade400,
          height: 24,
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            getTableRow(
              description: character.species,
              icon: Icons.accessibility_outlined,
              title: 'Species',
            ),
            getTableRow(
              title: 'Type',
              description: character.type == '' ? 'N/A' : character.type,
              icon: Icons.science_outlined,
            ),
            getTableRow(
              title: 'Gender',
              description: character.gender,
              icon: getGenderIcon(gender: character.gender),
            ),
            getTableRow(
              title: 'Origin',
              description: character.origin,
              icon: Icons.public_outlined,
            ),
            getTableRow(
              title: 'Location',
              description: character.location,
              icon: Icons.location_on_outlined,
            ),
          ],
        ),
      ],
    );
  }
}

TableRow getTableRow({
  required String description,
  required IconData? icon,
  required String title,
}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.grey.shade300,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade300),
          ),
        ]),
      ),
      Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

IconData getGenderIcon({required String gender}) {
  IconData genderIcon;
  switch (gender) {
    case 'Male':
      genderIcon = Icons.male_outlined;
      break;
    case 'Female':
      genderIcon = Icons.female_outlined;
      break;
    default:
      genderIcon = Icons.transgender_outlined;
  }
  return genderIcon;
}
