import 'package:books_app/src/feature/about_books/domain/models/article_entity.dart';
import 'package:flutter/services.dart';

Future<ArticleEntity> fetchNews() async {
  final responce = await rootBundle.loadString('assets/jsons/article.json');

  return newsEntityFromJson(responce);
}
