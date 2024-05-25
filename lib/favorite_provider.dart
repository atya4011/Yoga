import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void addFavorite(Map<String, dynamic> asana) {
    _favorites.add(asana);
    notifyListeners();
  }

  void removeFavorite(String title) {
    _favorites.removeWhere((asana) => asana['title'] == title);
    notifyListeners();
  }

  bool isFavorite(String title) {
    return _favorites.any((asana) => asana['title'] == title);
  }
}
