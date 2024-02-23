const String tableCards = 'cards';

class CardFields {
  static final List<String> values = [
    id,
    imagePath,
    title,
    author,
    genre,
    publishedYear,
    pagesQuantity,
    description,
    status,
    pageBookmark,
    comment,
  ];
}

class Card {
  final int? id;
  final String? imagePath;
  final String? title;
  final String? author;
  final String? genre;
  final int? publishedYear;
  final int? pagesQuantity;
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

  Card copy({
   int? id;
   String? imagePath;
   String? title;
   String? author;
   String? genre;
   int? publishedYear;
   int? pagesQuantity;
   String? description;
   String? status;
   int? pageBookmark;
   String? comment;
}) => 
      Card(id: id ?? this.id, 
      imagePath: imagePath ?? this.imagePath, 
      title: title ?? this.title, 
      author: author ?? this.author, 
      genre: genre ?? this.genre, 
      publishedYear: publishedYear ?? this.publishedYear, 
      pagesQuantity: pagesQuantity ?? this.pagesQuantity, 
      description: description ?? this.description, 
      status: status ?? this.status, 
      pageBookmark: pageBookmark ?? this.pageBookmark, 
      comment: comment ?? this.comment,
      );

      static Card fromJson(Map<String, Object?> json) => Card(
        id: json[CardFields.id] as int?, 
        imagePath: json[CardFields.imagePath] as String, 
        title: json[CardFields.title] as String, 
        author: json[CardFields.author] as String, 
        genre: json[CardFields.genre] as String, 
        publishedYear: json[CardFields.publishedYear] as int, 
        pagesQuantity: json[CardFields.pagesQuantity] as int, 
        description: json[CardFields.description] as String, 
        status: json[CardFields.status] as String, 
        pageBookmark: json[CardFields.pageBookmark] as int, 
        comment: json[CardFields.comment] as String,
        );

        Map<String, Object?> toJson() => {
          CardFields.id: id,
          CardFields.imagePath: imagePath,
          CardFields.title: title,
          CardFields.author: author,
          CardFields.genre: genre,
          CardFields.publishedYear: publishedYear,
          CardFields.pagesQuantity: pagesQuantity,
          CardFields.description: description,
          CardFields.status: status,
          CardFields.pageBookmark: pageBookmark,
          CardFields.comment: comment,
        };
}



      
