import 'package:flutter/material.dart';

import '../../widgets/wolf_card/wolf_card.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example App'),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: false,
                  onSelected: (value) {
                    controller.getMovies();
                  },
                ),
                ChoiceChip(
                  label: const Text('Horror'),
                  selected: false,
                  onSelected: (value) {
                    controller.filter('horror');
                  },
                ),
                ChoiceChip(
                  label: const Text('Comedy'),
                  selected: false,
                  onSelected: (value) {
                    controller.filter('comedy');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, movies, _) {
                  if (movies.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return WolfCard(
                        movie: movie,
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addMovie();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
