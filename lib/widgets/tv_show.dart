import 'package:flutter/material.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class TvShows extends StatelessWidget {
  const TvShows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, builder) {
          return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 200, 197, 197),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 45,
              width: 120,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Animations",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
