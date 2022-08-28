import 'package:equatable/equatable.dart';

class Music extends Equatable {
  final String trackName;
  final String artistName;
  final String collectionName;
  final String artworkUrl;
  final String previewUrl;

  Music({
    required this.trackName,
    required this.artistName,
    required this.collectionName,
    required this.artworkUrl,
    required this.previewUrl,
  });

  @override
  List<Object?> get props => [
        trackName,
        artistName,
        collectionName,
        artworkUrl,
        previewUrl,
      ];
}
