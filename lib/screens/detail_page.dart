import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/provider/detail_provider.dart';
import 'package:rick_and_morty_provider/provider/favorites_provider.dart';

import '../models/character.dart';
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
        Provider.of<DetailProvider>(context, listen: false)
            .initDetailPage(episodesList: widget.character.episode);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider provider = Provider.of<FavoritesProvider>(context);

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
                : const Icon(Icons.favorite_border, color: Colors.white),
          ),
        ],
      ),
      body: Consumer<DetailProvider>(
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
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          widget.character.name,
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabsInformation(
                  character: widget.character,
                  episodes: value.episodes,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
