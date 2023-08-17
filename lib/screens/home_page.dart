import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/screens/favorites_page.dart';
import 'package:rick_and_morty_provider/screens/list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _appBarTitle = '';

  void _setAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        setState(() {
          _appBarTitle = 'Rick and Morty App';
        });
        break;
      case 1:
        setState(() {
          _appBarTitle = 'Favorites';
        });
        break;
      default:
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _setAppBarTitle();
  }

  @override
  void initState() {
    _setAppBarTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          _appBarTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          switch (_selectedIndex) {
            case LobbyIndexes.home:
              return const ListPage();
            case LobbyIndexes.favorites:
              return const FavoritesPage();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(32, 35, 40, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        onTap: ((value) {
          _onItemTapped(value);
        }),
      ),
    );
  }
}

mixin LobbyIndexes {
  static const int home = 0;
  static const int favorites = 1;
}
