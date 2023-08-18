import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

import 'di/injector.dart';
import 'features/splash/presentation/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerDependencies();

  runApp(const RickAndMortyApp());
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
