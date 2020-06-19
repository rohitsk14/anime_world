class Anime {
  final int id;
  final int rank;
  final String title;
  final String image_url;
  final int episodes;
  final String start_date;
  final String end_date;
  final double score;

  Anime(
      {this.id,
      this.rank,
      this.title,
      this.image_url,
      this.episodes,
      this.start_date,
      this.end_date,
      this.score});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
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
