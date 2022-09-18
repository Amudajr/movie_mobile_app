import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:movie_app/views/movie_details.dart';
import 'package:movie_app/widgets/movies_card.dart';
import 'package:movie_app/widgets/tv_card.dart';
import 'package:movie_app/widgets/tv_show.dart';
import 'package:provider/provider.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MoviesProvider>().getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetails()));
                      },
                      icon: Icon(Icons.search_off_rounded)),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20, 25, 25, 0),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  labelText: "Type Movie Name",
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: (Icon(Icons.search_rounded)))),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Entertainment",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TV channels",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        child: TvChannels()),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Movies",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        child: MoviesCard()),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: TvShows()),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
