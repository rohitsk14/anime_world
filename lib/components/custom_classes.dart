class AnimeListClass {
  final int id;
  final int rank;
  final String title;
  final String image_url;
  final int episodes;
  final String start_date;
  final String end_date;
  final double score;

  AnimeListClass(
      {this.id,
      this.rank,
      this.title,
      this.image_url,
      this.episodes,
      this.start_date,
      this.end_date,
      this.score});

  factory AnimeListClass.fromJson(Map<String, dynamic> json) {
    return AnimeListClass(
      id: json['mal_id'],
      rank: json['rank'],
      title: json['title'],
      image_url: json['image_url'],
      episodes: json['episodes'],
      start_date: json['start_date'],
      end_date: json['end_date'],
      score: json['score'],
    );
  }
}

class TheAnimeClass {
  final int id;
  final int rank;
  final String title;
  final String english_title;
  final String image_url;
  final int episodes;
  final String synopsis;
  final String status;
  final String aired;
  final String rating;
  final int favorites;
  final double score;
  final List<GenreClass> genres;

  TheAnimeClass(
      {this.id,
      this.rank,
      this.title,
      this.english_title,
      this.image_url,
      this.episodes,
      this.synopsis,
      this.status,
      this.aired,
      this.rating,
      this.favorites,
      this.genres,
      this.score});

  factory TheAnimeClass.fromJson(Map<String, dynamic> json) {
    print('1');
    var genreObjsJson = json['genres'] as List;
    List<GenreClass> _Generes =
        genreObjsJson.map((tagJson) => GenreClass.fromJson(tagJson)).toList();
    print('2');
    return TheAnimeClass(
      id: json['mal_id'],
      rank: json['rank'],
      title: json['title'],
      english_title: json['title_english'],
      image_url: json['image_url'],
      episodes: json['episodes'],
      synopsis: json['synopsis'],
      status: json['status'],
      aired: json['aired']['string'],
      rating: json['rating'],
      favorites: json['favorites'],
      genres: _Generes,
      score: json['score'],
    );
  }
}

class GenreClass {
  final int id;
  final String name;
  final String type;

  GenreClass({this.id, this.name, this.type});

  factory GenreClass.fromJson(Map<String, dynamic> json) {
    return GenreClass(
      id: json['mal_id'],
      name: json['name'],
      type: json['type'],
    );
  }
}
