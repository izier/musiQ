import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musiq/presentation/bloc/player_bloc.dart';
import 'package:musiq/presentation/bloc/player_event.dart';
import 'package:musiq/presentation/bloc/player_state.dart';

class MusicBar extends StatefulWidget {
  @override
  State<MusicBar> createState() => _MusicBarState();
}

class _MusicBarState extends State<MusicBar> {
  final player = AudioPlayer();
  String title = '';
  String artwork = '';

  @override
  build(BuildContext context) {
    return BlocBuilder<PlayerBloc, MPlayerState>(
      builder: (context, state) {
        if (state is PlayerPlay) {
          player.setUrl(state.music.previewUrl);
          player.play();
          title = state.music.trackName.length < 32 ? state.music.trackName : (state.music.trackName.substring(0, 31) + '...');
          artwork = state.music.artworkUrl;
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(border: BorderDirectional(top: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid))),
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(imageUrl: state.music.artworkUrl),
                    SizedBox(width: 8),
                    Text(title),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<PlayerBloc>(context, listen: false).add(OnPauseMusic());
                  },
                  icon: const Icon(Icons.pause),
                )
              ],
            ),
          );
        } else if (state is PlayerPause) {
          player.pause();
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(border: BorderDirectional(top: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid))),
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(imageUrl: artwork),
                    SizedBox(width: 8),
                    Text(title),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<PlayerBloc>(context, listen: false).add(OnPlayMusic());
                  },
                  icon: const Icon(Icons.play_arrow),
                )
              ],
            ),
          );
        } else if (state is PlayerContinue) {
          player.play();
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(border: BorderDirectional(top: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid))),
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(imageUrl: artwork),
                    SizedBox(width: 8),
                    Text(title),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<PlayerBloc>(context, listen: false).add(OnPauseMusic());
                  },
                  icon: const Icon(Icons.pause),
                )
              ],
            ),
          );
        }
        return Container(height: 0);
      }
    );
  }
}