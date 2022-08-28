import 'package:musiq/domain/entities/music.dart';

abstract class PlayerRepository {
  Music playMusic(Music music);
}