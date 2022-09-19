import 'package:flutter/material.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class TvChannels extends StatelessWidget {
  const TvChannels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvsProvider = context.watch<MoviesProvider>();
    return tvsProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tvsProvider.movies.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final movie = tvsProvider.movies[index];
              return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 197, 197),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          movie.image.toString(),
                          height: 40,
                          width: 50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite_outline),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              movie.ratings.toString(),
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.fullTitle.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              movie.rank.toString(),
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
