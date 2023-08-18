import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

import 'core/presentation/favorites/core_favorites_cubit.dart';
import 'di/injector.dart';
import 'features/splash/presentation/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CoreFavoritesCubit>(
          create: (_) =>
              CoreFavoritesCubit(rickAndMortyFavoriteUseCases: injector.get()),
        ),
      ],
      child: const RickAndMortyApp(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedApp(
      child: MaterialApp(
        title: 'Rick and Morty App',
        debugShowCheckedModeBanner: false,
        theme: UiUtils.getAppTheme(),
        home: const SplashPage(),
      ),
    );
  }
}

class ConstrainedApp extends StatelessWidget {
  const ConstrainedApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 936,
            maxWidth: 485,
          ),
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
