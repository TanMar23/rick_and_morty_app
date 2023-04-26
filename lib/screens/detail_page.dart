import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../provider/character_provider.dart';
import '../widgets/circle_avatar_img.dart';

import '../widgets/tabs_information.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<CharacterProvider>(context, listen: false)
            .initDetailPage(episodesList: widget.character.episodesList);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CharacterProvider provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              provider.toggleFav(id: widget.character.id.toString());
            },
            icon: provider.isFav(widget.character.id.toString())
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border, color: Colors.grey),
          ),
        ],
      ),
      body: Consumer<CharacterProvider>(
        builder: (BuildContext context, value, child) {
          if (value.isLoadingEpisodes) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: <Widget>[
                    CircleAvatarImg(
                      img: widget.character.image,
                      status: widget.character.status,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        widget.character.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabsInformation(
                  character: widget.character,
                  episodes: provider.episodes,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
