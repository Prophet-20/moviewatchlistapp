import '../models/movie.dart';

// Movie information is separate from presentation. Synopses are original summaries.
const sampleMovies = <Movie>[
  Movie(
    id: 'inception', title: 'Inception',
    posterPath: 'assets/images/inception.png', year: 2010,
    genre: 'Science fiction', minutes: 148,
    cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Elliot Page', 'Tom Hardy'],
    synopsis: 'Dom Cobb steals secrets by entering dreams. An unusual client offers him a chance to return to his children if he can plant an idea instead of taking one. Cobb assembles a team for a journey through layered dreams, but memories of his wife threaten the mission. As the team moves deeper, the boundary between a convincing dream and reality becomes harder to trust.',
  ),
  Movie(
    id: 'matrix', title: 'The Matrix',
    posterPath: 'assets/images/matrix.png', year: 1999,
    genre: 'Science fiction', minutes: 136,
    cast: ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss', 'Hugo Weaving'],
    synopsis: 'A programmer known as Neo suspects that the world around him hides a secret. Trinity and Morpheus introduce him to a reality controlled by machines, where everyday life is a simulation. Neo joins their resistance and begins to question the limits of what he can do. His choices test the relationship between freedom, belief, and the systems that shape human life.',
  ),
  Movie(
    id: 'interstellar', title: 'Interstellar',
    posterPath: 'assets/images/interstellar.png', year: 2014,
    genre: 'Adventure', minutes: 169,
    cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain', 'Michael Caine'],
    synopsis: 'With Earth becoming increasingly difficult to farm, former pilot Cooper leaves his family to search for a new home for humanity. His crew travels through a wormhole to investigate distant planets. Time passes differently near the places they explore, turning each decision into a sacrifice for the people waiting on Earth. Cooper and his daughter Murph pursue different parts of the same struggle for survival.',
  ),
  Movie(
    id: 'spirited', title: 'Spirited Away',
    posterPath: 'assets/images/spirited.png', year: 2001,
    genre: 'Animation', minutes: 125,
    cast: ['Rumi Hiiragi', 'Miyu Irino', 'Mari Natsuki', 'Bunta Sugawara'],
    synopsis: 'Chihiro enters a mysterious spirit world after her family stops at an abandoned-looking attraction. When her parents are transformed, she takes a job in a bathhouse run by the witch Yubaba. With help from Haku and other unexpected friends, she learns to act with courage and compassion. Remembering who she is becomes essential to finding a way home.',
  ),
  Movie(
    id: 'budapest', title: 'The Grand Budapest Hotel',
    posterPath: 'assets/images/budapest.png', year: 2014,
    genre: 'Comedy drama', minutes: 99,
    cast: ['Ralph Fiennes', 'Tony Revolori', 'Saoirse Ronan', 'Adrien Brody'],
    synopsis: 'Zero, a young lobby boy, becomes the trusted companion of Gustave, the exacting concierge of a famous European hotel. A disputed inheritance and a stolen painting draw them into a fast-moving adventure. Behind the elaborate manners and comic escapes, Zero remembers a friendship and a way of life disrupted by political change.',
  ),
];
