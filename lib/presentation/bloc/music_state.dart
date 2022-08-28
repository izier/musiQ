import 'package:equatable/equatable.dart';
import 'package:musiq/domain/entities/music.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends MusicState {}

class SearchLoading extends MusicState {}

class SearchError extends MusicState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData extends MusicState {
  final List<Music> result;

  const SearchHasData(this.result);

  @override
  List<Object> get props => result;
}
