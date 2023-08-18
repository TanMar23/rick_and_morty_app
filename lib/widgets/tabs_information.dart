import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/episode_model.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

class TabsInformation extends StatelessWidget {
  const TabsInformation({
    super.key,
    required this.character,
    required this.episodes,
  });

  final CharacterModel character;
  final List<EpisodeModel> episodes;

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
            indicatorColor: Colors.amber,
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                SingleChildScrollView(child: InfoSection(character: character)),
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

  final List<EpisodeModel> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: ((context, index) {
        final episode = episodes[index];
        return ListTile(
          onTap: () {
            _displayBottomSheet(context, episode);
          },
          leading: Text(
            '${episode.id}',
          ),
          title: Text(
            episode.name,
          ),
          subtitle: Text(
            episode.airDate,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        );
      }),
    );
  }
}

void _displayBottomSheet(BuildContext context, EpisodeModel episode) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromRGBO(59, 62, 67, 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              episode.name,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.amber,
          ),
          EpisodeInfo(
            description: episode.episode.substring(1, 3),
            title: 'Season:',
          ),
          EpisodeInfo(
            description: episode.episode.substring(4, 6),
            title: 'Episode:',
          ),
          EpisodeInfo(
            description: episode.airDate,
            title: 'Air Date:',
          ),
        ]),
      );
    },
  );
}

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.character,
  });

  final CharacterModel character;

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
              context: context,
            ),
            getTableRow(
              title: 'Type',
              description: character.type == '' ? 'N/A' : character.type,
              icon: Icons.science_outlined,
              context: context,
            ),
            getTableRow(
              title: 'Gender',
              description: character.gender,
              icon: UiUtils.getGenderIcon(gender: character.gender),
              context: context,
            ),
            getTableRow(
              title: 'Origin',
              description: character.origin.name,
              icon: Icons.public_outlined,
              context: context,
            ),
            getTableRow(
              title: 'Location',
              description: character.location.name,
              icon: Icons.location_on_outlined,
              context: context,
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
  required BuildContext context,
}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 12),
          Text(title),
        ]),
      ),
      Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            child: Text(
              description,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: UiUtils.fade,
              softWrap: false,
              maxLines: 1,
            ),
          ),
        ],
      ),
    ],
  );
}

class EpisodeInfo extends StatelessWidget {
  const EpisodeInfo({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            ' $description',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
