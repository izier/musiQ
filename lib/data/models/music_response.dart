import 'package:equatable/equatable.dart';
import 'package:musiq/data/models/music_model.dart';

class MusicResponse extends Equatable {
  final List<MusicModel> musicList;

  MusicResponse({required this.musicList});

  factory MusicResponse.fromJson(var json) {
    final List<dynamic> results = json['results'];
    return MusicResponse(musicList: results.map((e) => MusicModel.fromJson(e)).toList());
  }

  @override
  List<Object?> get props => [musicList];
}
