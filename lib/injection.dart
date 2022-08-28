import 'package:get_it/get_it.dart';
import 'package:musiq/data/datasources/music_remote_data_source.dart';
import 'package:musiq/data/repositories/music_repository.dart';
import 'package:musiq/domain/repositories/music_repository.dart';
import 'package:musiq/domain/usecases/search_music.dart';
import 'package:musiq/domain/usecases/start_player.dart';
import 'package:musiq/presentation/bloc/music_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:musiq/presentation/bloc/player_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => MusicBloc(locator()),
  );
  locator.registerFactory(
    () => PlayerBloc(locator()),
  );

  // data sources
  locator.registerLazySingleton<MusicRemoteDataSource>(
        () => MusicRemoteDataSourceImpl(client: locator()),
  );

  // repository
  locator.registerLazySingleton<MusicRepository>(
      () => MusicRepositoryImpl(remoteDataSource: locator()));

  // use case
  locator.registerLazySingleton(() => SearchMusic(repository: locator()));
  locator.registerLazySingleton(() => StartPlayer());

  // external
  locator.registerLazySingleton(() => http.Client());
}
