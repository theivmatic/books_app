import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

@JsonSerializable()
class ArticleEntity {
  @JsonKey(name: 'articles')
	List<Article>? articles;

	ArticleEntity({this.articles});
}

@JsonSerializable()
class Article {
  @JsonKey(name: 'title')
	String? title;
  @JsonKey(name: 'image_path')
	String? imagePath;
  @JsonKey(name: 'items')
	List<Item>? items;

	Article({this.title, this.imagePath, this.items});
}

@JsonSerializable()
class Item {
  @JsonKey(name: 'title')
	String? title;
  @JsonKey(name: 'text')
  String? text;
}
