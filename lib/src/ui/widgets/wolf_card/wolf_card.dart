import 'package:flutter/material.dart';

import '../../../models/movie.dart';

class WolfCard extends StatelessWidget {
  final Movie movie;
  const WolfCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(movie.name),
          subtitle: Text(movie.id),
        ),
      ),
    );
  }
}
