import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/global_provider.dart';
import 'package:movie_app/widgets/widgets.dart';

class MoviesList extends ConsumerWidget {
  const MoviesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesProvider = ref.watch(movieProvider);
    // final moviesFuture = ref.watch(moviesProvider);

    // return moviesFuture.when(
    //   data: (List<MoviesModel> movies) {
    //     return ListView.separated(
    //       shrinkWrap: true,
    //       scrollDirection: Axis.horizontal,
    //       itemCount: movies.length,
    //       separatorBuilder: (context, index) => const SizedBox(width: 15),
    //       itemBuilder: (context, index) {
    //         final movie = movies[index];
    //         return MovieCard(
    //           image: movie.image!,
    //           title: movie.fullTitle!,
    //         );
    //       },
    //     );
    //   },
    //   error: (error, _) => Text(error.toString()),
    //   loading: () => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    return moviesProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviesProvider.movies.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final movie = moviesProvider.movies[index];
              return MovieCard(
                image: movie.image!,
                title: movie.fullTitle!,
              );
            },
          );
  }
}
