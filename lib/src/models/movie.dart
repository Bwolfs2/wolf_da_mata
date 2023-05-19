class Movie {
  final String id;
  final String name;

  Movie(this.id, this.name);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'] as String,
      json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
