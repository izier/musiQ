import 'package:equatable/equatable.dart';
import 'package:musiq/domain/entities/music.dart';

abstract class MPlayerState extends Equatable {
  const MPlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitial extends MPlayerState {}

class PlayerBuffering extends MPlayerState {}

class PlayerPlay extends MPlayerState {
  final Music music;

  const PlayerPlay({required this.music});

  @override
  List<Object> get props => [music];
}

class PlayerPause extends MPlayerState {}

class PlayerContinue extends MPlayerState {}