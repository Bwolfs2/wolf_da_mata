import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../pages/details/details_page.dart';

class WolfCard extends StatelessWidget {
  final Movie movie;
  const WolfCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Image.network(
            movie.imageUrl,
            height: 400,
          ),
          title: Text(movie.name),
          subtitle: Text(movie.id),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  movie: movie,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
