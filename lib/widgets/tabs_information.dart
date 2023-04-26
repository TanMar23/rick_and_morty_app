import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/models/episode.dart';

import '../models/character.dart';

class TabsInformation extends StatelessWidget {
  const TabsInformation({
    super.key,
    required this.character,
    required this.episodes,
  });

  final Character character;
  final List<Episode> episodes;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'About'),
    Tab(text: 'Episodes'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(59, 62, 67, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const TabBar(
            tabs: myTabs,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.amber,
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InfoSection(character: character),
          ),
          EpisodesSection(episodes: episodes)
        ]),
      ),
    );
  }
}

class EpisodesSection extends StatelessWidget {
  const EpisodesSection({
    Key? key,
    required this.episodes,
  }) : super(key: key);

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: ((context, index) {
        final episode = episodes[index];
        return ListTile(
          leading: Text(
            '${episode.id}',
            style: TextStyle(color: Colors.grey.shade300),
          ),
          title: Text(
            episode.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            episode.airDate,
            style: TextStyle(color: Colors.grey.shade300),
          ),
        );
      }),
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
