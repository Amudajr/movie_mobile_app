import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: searchProvider.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                mainAxisExtent: 80,
              ),
              itemCount: searchProvider.search.length,
              itemBuilder: (context, index) {
                final movie = searchProvider.search[index];
                return Column(
                  children: [
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(movie.image.toString()))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(movie.title.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    Text(movie.description.toString()),
                  ],
                );
              }),
    );
  }
}
