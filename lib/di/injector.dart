import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/character_service.dart';
import '../services/episode_service.dart';

final GetIt injector = GetIt.asNewInstance();

void registerDependencies() {
  injector.registerFactory<CharacterService>(
      () => CharacterService(dio: injector<Dio>()));
  injector.registerFactory<EpisodesService>(
      () => EpisodesService(dio: injector<Dio>()));
}
