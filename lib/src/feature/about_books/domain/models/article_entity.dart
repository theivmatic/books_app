class ArticleEntity {
	List<Article>? articles;

	ArticleEntity({this.articles});
}

class Article {
	String? title;
	String? imagePath;
	List<Item>? items;

	Article({this.title, this.imagePath, this.items});
}

class Item {
	String? title;
  String? text;
}
