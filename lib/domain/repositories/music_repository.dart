import 'package:musiq/domain/entities/music.dart';
import 'package:dartz/dartz.dart';
import 'package:musiq/common/failure.dart';

abstract class MusicRepository {
  Future<Either<Failure, List<Music>>> searchMusic(String query);
}
