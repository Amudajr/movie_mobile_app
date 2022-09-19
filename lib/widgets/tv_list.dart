import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/global_provider.dart';
import 'package:movie_app/widgets/widgets.dart';

class TvList extends ConsumerWidget {
  const TvList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tvsProvider = ref.watch(movieProvider);
    // final tvsProvider = ref.watch(tvProvider);
    // return tvsProvider.when(
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
    return tvsProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tvsProvider.movies.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (BuildContext context, index) {
              final movie = tvsProvider.movies[index];
              return MovieCard(
                image: movie.image!,
                title: movie.fullTitle!,
              );
            },
          );
  }
}

//