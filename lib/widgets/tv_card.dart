import 'package:flutter/material.dart';

class TvChannels extends StatelessWidget {
  const TvChannels({
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
              height: 150,
              width: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/nbc.png",
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
                          "3.7m",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
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
                          "Cartoon Network",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Warmer Bros",
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
