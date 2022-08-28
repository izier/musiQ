import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:musiq/domain/usecases/search_music.dart';
import 'package:musiq/presentation/bloc/music_event.dart';
import 'package:musiq/presentation/bloc/music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final SearchMusic _searchMusic;

  MusicBloc(this._searchMusic) : super(SearchInitial()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final result = await _searchMusic.execute(query);

      result.fold((failure) {
        emit(SearchError(failure.message));
      }, (data) {
        emit(SearchHasData(data));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
