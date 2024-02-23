class Card {
  final int? id;
  final String? imagePath;
  final String? title;
  final String? author;
  final String? genre;
  final int? publishedYear;
  final String? pagesQuantity;
  final String? description;
  final String? status;
  final int? pageBookmark;
  final String? comment;

  Card({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.genre,
    required this.publishedYear,
    required this.pagesQuantity,
    required this.description,
    required this.status,
    required this.pageBookmark,
    required this.comment,
  });
}
