import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  final String dbName = "database.db";
  final String tableName = "News";

  late Database db;

  Future<void> initializeDB() async {
    final directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, dbName);

    db = await openDatabase(
      join(dbPath, dbName),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE $tableName(id INTEGER PRIMARY KEY NOT NULL, description TEXT NOT NULL, title TEXT NOT NULL,image TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<void> createNews(NewsModel newsModel) async {
    await db.insert(
      tableName,
      newsModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<NewsModel>> getItems() async {
    final List<Map<String, Object?>> queryResult = await db.query(
      tableName,
    );
    return queryResult.map((e) => NewsModel.fromMap(e)).toList();
  }

  Future<void> deleteItem(String id) async {
    try {
      await db.delete(tableName, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  Future<int> update(Map<String, dynamic> row) async {
    int id = row['id'];
    return await db.update(
      tableName,
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class NewsModel {
  int? id;
  String? title;
  String? description;
  String? image;

  NewsModel({this.title, this.description, this.image, this.id});

  NewsModel.fromMap(Map<String, dynamic> item) {
    id = item['id'];
    title = item['title'];
    description = item['description'];
    image = item['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
