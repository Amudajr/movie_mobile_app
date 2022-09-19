import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/utils/constants.dart';

class SearchProvider extends ChangeNotifier {
  List<SearchModel> _search = [];
  bool _loading = true;

  bool get loading => _loading;
  List<SearchModel> get search => _search;

  Future<void> searchMovie(String value) async {
    try {
      _loading = true;
      notifyListeners();
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/SearchTitle/${Constants.myKey}/$value'),
      );
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        _loading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final searches = (data['results'] as List)
            .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
            .toList();

        final userSearch = searches
            .where((element) => element.expression?.trim() == value.trim())
            .toList();
        _search = userSearch;
        notifyListeners();
      } else {
        _loading = false;
        _search = [];
        notifyListeners();
      }
    } catch (error) {
      _loading = false;
      _search = <SearchModel>[];
      notifyListeners();
    }
  }
}
