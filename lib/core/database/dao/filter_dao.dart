import 'package:sqflite/sqflite.dart';
import '../../../feature/filter/data/model/filter_option.dart';
import '../app_database.dart';

class FilterDao {
  Future<int> insertFilter(FilterOption option) async {
    final db = await AppDatabase.database;
    return await db.insert(
      'filter_options',
      option.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FilterOption>> getAllFilters() async {
    final db = await AppDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query('filter_options');

    return maps.map((e) => FilterOption.fromMap(e)).toList();
  }

  Future<int> updateSelectedValue(int id, String newValue) async {
    final db = await AppDatabase.database;
    return await db.update(
      'filter_options',
      {'selectedValue': newValue},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
