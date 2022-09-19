import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:movie_app/provider/search_provider.dart';

final movieProvider = ChangeNotifierProvider<MoviesProvider>((ref) {
  return MoviesProvider();
});

final searchProvider = ChangeNotifierProvider<SearchProvider>((ref) {
  return SearchProvider();
});
