import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/model/character_model.dart';

import '../../../../../widgets/circle_avatar_img.dart';
import '../../../../../widgets/tabs_information.dart';
import '../cubit/detail_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.character,
  });

  final CharacterModel character;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final DetailCubit cubit = context.read();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              cubit.toggleFavorite(widget.character.id.toString());
            },
            icon: cubit.isFav(widget.character.id.toString())
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state.isLoading) {
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
                  episodes: state.episodesList,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
