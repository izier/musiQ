import 'dart:convert';
import 'package:musiq/common/exception.dart';
import 'package:musiq/data/models/music_model.dart';
import 'package:http/http.dart' as http;
import 'package:musiq/data/models/music_response.dart';

abstract class MusicRemoteDataSource {
  Future<List<MusicModel>> searchMusic(String query);
}

class MusicRemoteDataSourceImpl implements MusicRemoteDataSource {
  static const BASE_URL = 'https://itunes.apple.com/';

  final http.Client client;

  MusicRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MusicModel>> searchMusic(String query) async {
    List splittedQuery = query.split(' ');
    String finalQuery = '';
    if (splittedQuery.length > 1) {
      for (int i = 0; i < splittedQuery.length; i++) {
        if (i == 0) {
          finalQuery = splittedQuery[0];
        } else {
          String word = splittedQuery[i];
          finalQuery += '+$word';
        }
      }
    } else {
      finalQuery = splittedQuery[0];
    }

    final response =
        await client.get(Uri.parse('$BASE_URL/search?term=$finalQuery&entity=song'));

    if (response.statusCode == 200) {
      return MusicResponse.fromJson(json.decode(response.body)).musicList;
    } else {
      throw ServerException();
    }
  }
}
