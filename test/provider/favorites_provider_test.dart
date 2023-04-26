import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_provider/provider/favorites_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('FavoritesProvider', () {
    late FavoritesProvider favoritesProvider;
    late SharedPreferences sharedPreferences;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      favoritesProvider = FavoritesProvider([]);
    });

    test('toggleFav adds an element to favorites', () async {
      expect(favoritesProvider.favorites, isEmpty);
      await favoritesProvider.toggleFav(id: '1');
      expect(favoritesProvider.favorites, contains('1'));
    });

    test('toggleFav removes an element of favorites', () async {
      favoritesProvider = FavoritesProvider(['1', '2']);
      expect(favoritesProvider.favorites, contains('1'));
      await favoritesProvider.toggleFav(id: '1');
      expect(favoritesProvider.favorites, isNot(contains('1')));
    });

    test('isFav returns truthy if item is contained in favorites', () {
      favoritesProvider = FavoritesProvider(['1', '2']);
      expect(favoritesProvider.isFav('1'), isTrue);
    });

    test('isFav retruns false if item is not contained in favorites', () async {
      favoritesProvider = FavoritesProvider(['1', '2']);
      expect(favoritesProvider.isFav('3'), isFalse);
    });
  });
}
