import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/global_provider.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

final moviesProvider = FutureProvider<List<MoviesModel>>((ref) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/Top250Movies/${Constants.myKey}'),
  );
  // if (response.statusCode == HttpStatus.ok) {
  final data = jsonDecode(response.body);
  final allmovies = (data['items'] as List)
      .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
      .toList();
  final seeMovies = allmovies.toList();
  return seeMovies;
});

final tvProvider = FutureProvider<List<MoviesModel>>((ref) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/Top250TVs/${Constants.myKey}'),
  );
  // if (response.statusCode == HttpStatus.ok) {
  final data = jsonDecode(response.body);
  final allmovies = (data['items'] as List)
      .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
      .toList();
  final seeMovies = allmovies.toList();
  return seeMovies;
});

class MovieHome extends ConsumerStatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieHomeState();
}

class _MovieHomeState extends ConsumerState<MovieHome> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(movieProvider.notifier).getMovies();
      ref.read(movieProvider.notifier).getTvShows();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = ref.watch(movieProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchFiled(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Entertainment",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "TV channels",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: const TvList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Movies",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: const MoviesList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
