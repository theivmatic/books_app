import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

ArticleEntity newsEntityFromJson(String str) =>
    ArticleEntity.fromJson(jsonDecode(str) as Map<String, dynamic>);

@JsonSerializable()
class ArticleEntity {
  @JsonKey(name: 'articles')
  List<Article>? articles;

  ArticleEntity({
    this.articles,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => _$ArticleEntityFromJson(json);
}

@JsonSerializable()
class Article {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'image_path')
  String? imagePath;
  @JsonKey(name: 'items')
  List<Item>? items;

  Article({
    this.title,
    this.imagePath,
    this.items,
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}

@JsonSerializable()
class Item {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'text')
  String? text;

  Item({
    this.title,
    this.text,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
