import 'package:flutter/material.dart';
import 'package:tugas2/model/manga.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _rememberMe = false;
  String? _authToken;

  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;
  String? get authToken => _authToken;

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _authToken = "dummy_token_${DateTime.now().millisecondsSinceEpoch}";
    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _authToken = null;
    notifyListeners();
  }
}

class MangaProvider with ChangeNotifier {
  List<Manga> _mangas = [];
  String _selectedGenre = "Fantasi";

  List<Manga> get filteredMangas =>
      _mangas.where((manga) => manga.genres.contains(_selectedGenre)).toList();

  List<Manga> get allMangas => _mangas;

  String get selectedGenre => _selectedGenre;

  List<String> get availableGenres {
    Set<String> genres = {};
    for (var manga in _mangas) {
      genres.addAll(manga.genres);
    }
    return genres.toList();
  }

  void loadMangas() {
    _mangas = dummyMangas;
    notifyListeners();
  }

  void setGenre(String genre) {
    _selectedGenre = genre;
    notifyListeners();
  }
}