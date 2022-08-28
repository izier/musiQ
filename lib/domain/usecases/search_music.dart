import 'package:dartz/dartz.dart';
import 'package:musiq/common/failure.dart';
import 'package:musiq/domain/entities/music.dart';
import 'package:musiq/domain/repositories/music_repository.dart';

class SearchMusic {
  final MusicRepository repository;

  SearchMusic({required this.repository});

  Future<Either<Failure, List<Music>>> execute(String query) {
    return repository.searchMusic(query);
  }
}
