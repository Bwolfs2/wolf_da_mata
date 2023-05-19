import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie.dart';

class MovieRepository {
  final moviesRef = FirebaseFirestore.instance
      .collection('movies')
      .withConverter<Movie>(
          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson());

  Future<List<Movie>> getMovies() async {
    final movies = await moviesRef.get();
    return movies.docs.map((e) => e.data()).toList();
  }

  void addMovie({required String id, required String name}) {
    moviesRef.doc(id).set(
          Movie(
            id,
            name,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjtY_EqGA246IDir0ohdiUs-krqW_PV1BB_Q&usqp=CAU',
          ),
        );
  }

  Future<List<Movie>> getMoviesByPlant(String type) async {
    final movies = await moviesRef.where('type', isEqualTo: type).get();
    return movies.docs.map((e) => e.data()).toList();
  }
}
