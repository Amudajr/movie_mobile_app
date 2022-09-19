import 'package:flutter/material.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class MoviesCard extends StatelessWidget {
  late String title;
  MoviesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = context.watch<MoviesProvider>();
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
              return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 197, 197),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 170,
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          movie.image.toString(),
                          height: 50,
                          width: 65,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite_outline),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              movie.rank.toString(),
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.fullTitle.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 2),
                            Text(
                              movie.ratings.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
            });
  }
}
