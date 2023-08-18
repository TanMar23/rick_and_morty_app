import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/data/rick_and_morty_data_repository.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_favorites_usecases.dart';
import 'package:rick_and_morty_provider/features/rick_and_morty_api/domain/rick_and_morty_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt injector = GetIt.asNewInstance();

Future<void> registerDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  injector.registerFactory<Dio>(() => Dio());
  injector.registerFactory<RickAndMortyRepository>(
      () => RickAndMortyDataRepository(dio: injector<Dio>()));
  injector.registerLazySingleton<RickAndMortyFavoriteUseCases>(
    () => RickAndMortyFavoriteUseCasesImp(
      remoteRepository: injector.get(),
      sharedPreferences: sharedPreferences,
    ),
  );
}
