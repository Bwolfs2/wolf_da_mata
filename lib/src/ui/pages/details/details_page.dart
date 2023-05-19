import 'package:flutter/material.dart';
import 'package:wolf_da_mata/src/models/movie.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Column(
        children: [
          Image.network(
            widget.movie.imageUrl,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          Text(widget.movie.name),
          Text(widget.movie.id),
        ],
      ),
    );
  }
}
