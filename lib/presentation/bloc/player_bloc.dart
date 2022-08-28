import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiq/domain/usecases/start_player.dart';
import 'package:musiq/presentation/bloc/player_event.dart';
import 'package:musiq/presentation/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, MPlayerState> {
  final StartPlayer _startPlayer;

  PlayerBloc(this._startPlayer) : super(PlayerInitial()) {
    on<OnStartMusic>((event, emit) async {
      emit(PlayerPlay(music: event.music));
    });
    on<OnPauseMusic>((event, emit) async {
      emit(PlayerPause());
    });
    on<OnPlayMusic>((event, emit) async {
      emit(PlayerContinue());
    });
  }
}