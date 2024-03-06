import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ArticleEntity {
	List<Article>? articles;

	ArticleEntity({this.articles});
}

@JsonSerializable()
class Article {
	String? title;
	String? imagePath;
	List<Item>? items;

	Article({this.title, this.imagePath, this.items});
}

@JsonSerializable()
class Item {
	String? title;
  String? text;
}
