import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CardsDatabase {
  static final CardsDatabase instance = CardsDatabase._init();

  static Database? _database;

  CardsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cards.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<dynamic> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableCards (
  ${CardFields.id} $idType,
  ${CardFields.imagePath} $textType,
  ${CardFields.title} $textType,
  ${CardFields.author} $textType,
  ${CardFields.genre} $textType,
  ${CardFields.publishedYear} $textType,
  ${CardFields.pagesQuantity} $textType,
  ${CardFields.description} $textType,
  ${CardFields.status} $textType,
  ${CardFields.pageBookmark} $textType,
  ${CardFields.comment} $textType
)
''');
  }

  Future<BookCard> createCard(BookCard card) async {
    final db = await instance.database;

    final id = await db.insert(tableCards, card.toJson());
    return card.copy(id: id);
  }

  Future<BookCard> readCard({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCards,
      columns: CardFields.values,
      where: '${CardFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return BookCard.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<BookCard>> readAllCards() async {
    final db = await instance.database;

    final result = await db.query(tableCards);

    return result.map(BookCard.fromJson).toList();
  }

  Future<int> updateCard({required BookCard bookCard}) async {
    final db = await instance.database;

    return db.update(
      tableCards,
      bookCard.toJson(),
      where: '${CardFields.id} = ?',
      whereArgs: [bookCard.id],
    );
  }

  Future<int> deleteCard({required int id}) async {
    final db = await instance.database;

    return db.delete(
      tableCards,
      where: '${CardFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<dynamic> close() async {
    final db = await instance.database;

    await db.close();
  }
}
