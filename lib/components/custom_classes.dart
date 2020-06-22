class AnimeListClass {
  final int id;
  final int rank;
  final String title;
  final String image_url;
  final int episodes;
  final String start_date;
  final String end_date;
  final String score;

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
      score: json['score'].toString() == null ? 'NA' : json['score'].toString(),
    );
  }
}

class TheAnimeClass {
  final int id;
  final int rank;
  final String title;
  final String english_title;
  final String image_url;
  final String episodes;
  final String synopsis;
  final String status;
  final String aired;
  final String rating;
  final String favorites;
  final String score;
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
    var genreObjsJson = json['genres'] as List;
    List<GenreClass> _Generes =
        genreObjsJson.map((tagJson) => GenreClass.fromJson(tagJson)).toList();
    return TheAnimeClass(
      id: json['mal_id'],
      rank: json['rank'],
      title: json['title'] == null ? 'NA' : json['title'].toString(),
      english_title: json['title_english'] == null
          ? 'NA'
          : json['title_english'].toString(),
      image_url:
          json['image_url'] == null ? 'NA' : json['image_url'].toString(),
      episodes: json['episodes'] == null ? 'NA' : json['episodes'].toString(),
      synopsis: json['synopsis'] == null ? 'NA' : json['synopsis'].toString(),
      status: json['status'] == null ? 'NA' : json['status'].toString(),
      aired: json['aired']['string'] == null
          ? 'NA'
          : json['aired']['string'].toString(),
      rating: json['rating'] == null ? 'NA' : json['rating'].toString(),
      favorites:
          json['favorites'] == null ? 'NA' : json['favorites'].toString(),
      genres: _Generes,
      score: json['score'] == null ? 'NA' : json['score'].toString(),
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
