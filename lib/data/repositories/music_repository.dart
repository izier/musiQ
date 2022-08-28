import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:musiq/common/exception.dart';
import 'package:musiq/common/failure.dart';
import 'package:musiq/data/datasources/music_remote_data_source.dart';
import 'package:musiq/domain/entities/music.dart';
import 'package:musiq/domain/repositories/music_repository.dart';

class MusicRepositoryImpl implements MusicRepository {
  final MusicRemoteDataSource remoteDataSource;

  MusicRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Music>>> searchMusic(String query) async {
    try {
      final result = await remoteDataSource.searchMusic(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect tho the network'));
    }
  }
}
