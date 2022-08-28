import 'package:equatable/equatable.dart';
import 'package:musiq/domain/entities/music.dart';

class MusicModel extends Equatable {
  final String trackName;
  final String artistName;
  final String collectionName;
  final String artworkUrl;
  final String previewUrl;

  MusicModel({
    required this.trackName,
    required this.artistName,
    required this.collectionName,
    required this.artworkUrl,
    required this.previewUrl,
  });

  factory MusicModel.fromJson(var json) => MusicModel(
        trackName: json["trackName"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        artworkUrl: json["artworkUrl100"],
        previewUrl: json["previewUrl"],
      );

  Music toEntity() {
    return Music(
      trackName: trackName,
      artistName: artistName,
      collectionName: collectionName,
      artworkUrl: artworkUrl,
      previewUrl: previewUrl,
    );
  }

  @override
  List<Object?> get props => [
        trackName,
        artistName,
        collectionName,
        artworkUrl,
        previewUrl,
      ];
}
