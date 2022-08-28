import 'package:equatable/equatable.dart';
import 'package:musiq/domain/entities/music.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class OnStartMusic extends PlayerEvent {
  final Music music;

  const OnStartMusic(this.music);

  @override
  List<Object> get props => [music];
}

class OnPauseMusic extends PlayerEvent {}

class OnPlayMusic extends PlayerEvent {}