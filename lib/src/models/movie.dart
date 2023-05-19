class Movie {
  final String id;
  final String name;
  final String imageUrl;

  Movie(this.id, this.name, this.imageUrl);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'] as String,
      json['name'] as String,
      json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };
}
