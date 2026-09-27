import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/movie_poster.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(movie.title, style: const TextStyle(fontSize: 17)),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 240,
                    height: 360,
                    child: MoviePoster(movie: movie),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  '${movie.year}  •  ${movie.genre}  •  ${movie.minutes} min',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 26),
                const Text(
                  'THE STORY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  movie.synopsis,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.65,
                    color: Color(0xFFD3D6DB),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'STARRING',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: movie.cast
                      .map((actor) => Chip(label: Text(actor)))
                      .toList(),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Theatrical release poster • CW-02 collection',
                  style: TextStyle(fontSize: 11, color: Color(0xFFB8BDC4)),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
