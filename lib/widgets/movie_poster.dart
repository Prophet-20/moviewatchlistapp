import 'package:flutter/material.dart';

import '../models/movie.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;
  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) => Hero(
    tag: 'poster-${movie.id}',
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        movie.posterPath,
        fit: BoxFit.contain,
        semanticLabel: '${movie.title} movie poster',
        errorBuilder: (context, error, stackTrace) => ColoredBox(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const Center(child: Icon(Icons.movie_outlined, size: 48)),
        ),
      ),
    ),
  );
}
