import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiq/domain/entities/music.dart';
import 'package:musiq/presentation/bloc/player_bloc.dart';
import 'package:musiq/presentation/bloc/player_event.dart';
import 'package:musiq/presentation/bloc/player_state.dart';

class MusicCard extends StatelessWidget {
  final Music music;
  final int index;

  MusicCard(this.music, this.index);

  @override
  Widget build(BuildContext context) {
    String url = '';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0,4)
          ),
        ]
      ),
      child: InkWell(
        onTap: () {
          BlocProvider.of<PlayerBloc>(context, listen: false).add(OnStartMusic(music));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: music.artworkUrl),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      music.trackName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      music.artistName,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      music.collectionName,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BlocBuilder<PlayerBloc, MPlayerState>(
                builder: (context, state) {
                  if (state is PlayerPlay) {
                    url = state.music.previewUrl;
                  }
                  if (url == music.previewUrl) {
                    return const Icon(Icons.graphic_eq);
                  } else {
                    return const Icon(Icons.play_arrow);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
