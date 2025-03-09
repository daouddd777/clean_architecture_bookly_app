class BookEntity {
  final String title;
  final String authorName;
  final num price;
  final num rating;
  final String image;

  BookEntity(
      {required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.image});
}
