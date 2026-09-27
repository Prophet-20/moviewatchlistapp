import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../widgets/movie_poster.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        'THE SCREENING ROOM',
        style: TextStyle(
          fontSize: 15,
          letterSpacing: 2.2,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: const Icon(Icons.local_movies_outlined),
    ),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView.builder(
            key: const PageStorageKey('movie-catalog'),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            itemCount: sampleMovies.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YOUR NEXT GREAT FILM',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 11,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Make it a\nmovie night.',
                        style: TextStyle(
                          fontSize: 38,
                          height: 1.1,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Five stories worth getting lost in.\nTap a film to explore the cast and story.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFFB8BDC4),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Text(
                            'THE COLLECTION',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '05 FILMS',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFB8BDC4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              final movie = sampleMovies[index - 1];
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xFF1B222B),
                  child: InkWell(
                    key: ValueKey('movie-${movie.id}'),
                    onTap: () => Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(movie: movie),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90,
                            height: 120,
                            child: MoviePoster(movie: movie),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${movie.year}  /  ${movie.minutes} MIN',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontSize: 11,
                                    letterSpacing: .8,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.15,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  movie.genre,
                                  style: const TextStyle(
                                    color: Color(0xFFB8BDC4),
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Row(
                                  children: [
                                    Text(
                                      'Explore film',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.arrow_forward, size: 15),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}
