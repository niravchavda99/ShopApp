import 'package:flutter/cupertino.dart';

class Favorites with ChangeNotifier {
  Map<String, Set<String>> _favorites = {};

  void addFavorite(String username, String productId) {
    if (_favorites.containsKey(username)) {
      _favorites.update(username, (userFavorites) {
        userFavorites.add(productId);
        return userFavorites;
      });
    } else {
      _favorites.putIfAbsent(username, () => [productId].toSet());
    }
    notifyListeners();
  }

  void removeFavorite(String username, String productId) {
    if (_favorites.containsKey(username)) {
      _favorites.update(username, (userFavorites) {
        userFavorites.remove(productId);
        return userFavorites;
      });
    }
    notifyListeners();
  }

  bool isFavorite(String username, String productId) {
    return _favorites.containsKey(username) &&
        _favorites.entries
            .firstWhere((e) => e.key == username)
            .value
            .contains(productId);
  }
}
