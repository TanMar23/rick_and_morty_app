import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigateToHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(39, 43, 51, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Hero(
              tag: 'assets/images/rick_and_morty.png',
              child: Image.asset('assets/images/rick_and_morty.png')),
        ),
      ),
    );
  }

  void _navigateToHome() {
    Future<void>.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (BuildContext context) {
          return const HomePage();
        }),
      );
    });
  }
}
