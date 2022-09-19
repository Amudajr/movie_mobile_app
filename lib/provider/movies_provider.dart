import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  List<MoviesModel> _movies = [];
  bool _loading = true;

  bool get loading => _loading;
  List<MoviesModel> get movies => _movies;

  Future<void> getMovies() async {
    try {
      _loading = true;
      notifyListeners();
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/Top250TVs/${Constants.myKey}'),
      );
      if (response.statusCode == HttpStatus.ok) {
        _loading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final allmovies = (data['items'] as List)
            .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
            .toList();
        final seeMovies = allmovies.toList();
        _movies = seeMovies;
        notifyListeners();
      } else {
        _loading = false;
        _movies = [];
        notifyListeners();
      }
    } catch (error) {
      print(error);
      _loading = false;
      _movies = <MoviesModel>[];
      notifyListeners();
    }
  }

  Future<void> getTvShows() async {
    try {
      _loading = true;
      notifyListeners();
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/Top250TVs/${Constants.myKey}'),
      );
      if (response.statusCode == HttpStatus.ok) {
        _loading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final allTvs = (data['items'] as List)
            .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
            .toList();
        final seeTvs = allTvs.toList();
        _movies = seeTvs;
        notifyListeners();
      } else {
        _loading = false;
        _movies = [];
        notifyListeners();
      }
    } catch (error) {
      print(error);
      _loading = false;
      _movies = <MoviesModel>[];
      notifyListeners();
    }
  }
}
