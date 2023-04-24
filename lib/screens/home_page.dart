import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/screens/list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 43, 51, 1),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Rick and Morty App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const ListPage(),
    );
  }
}
