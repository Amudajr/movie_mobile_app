import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/global_provider.dart';
import 'package:movie_app/views/movie_details.dart';

class SearchFiled extends ConsumerWidget {
  const SearchFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onFieldSubmitted: (value) async {
        final searchResult =
            await ref.read(searchProvider.notifier).searchMovie(value);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => SearchResult()));
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieDetails(),
                  ),
                );
              },
              icon: const Icon(Icons.search_off_rounded)),
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 25, 25, 0),
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
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: IconButton(
              onPressed: () {}, icon: (const Icon(Icons.search_rounded)))),
    );
  }
}
