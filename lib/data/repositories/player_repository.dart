import 'package:musiq/domain/entities/music.dart';
import 'package:musiq/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {

  @override
  Music playMusic(Music music) {
    return music;
  }
}