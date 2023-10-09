class Book {
  final String imgUrl;
  final String title;
  final String description;
  final String rating;
  final String genre;

  Book({
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.genre,
  });

  factory Book.fromMap(Map<String, dynamic> map) => Book(
        imgUrl: map['imgUrl'],
        title: map['title'],
        description: map['description'],
        rating: map['rating'],
        genre: map['genre'],
      );
}
