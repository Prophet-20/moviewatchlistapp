/// One movie passed intact from the catalog to its details route.
class Movie {
  final String id;
  final String title;
  final String posterPath;
  final List<String> cast;
  final String synopsis;
  final int year;
  final String genre;
  final int minutes;

  const Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.cast,
    required this.synopsis,
    required this.year,
    required this.genre,
    required this.minutes,
  });
}
