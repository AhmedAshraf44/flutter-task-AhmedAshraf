import 'package:sqflite/sqflite.dart';
import '../../../feature/filtering/data/model/filter_option.dart';
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

  // Future<void> seedFilters() async {
  //   final db = await AppDatabase.database;
  //   final count = Sqflite.firstIntValue(
  //     await db.rawQuery('SELECT COUNT(*) FROM filter_options'),
  //   );
  //   if (count == 0) {
  //     final defaultFilters = [
  //       FilterOption(
  //         title: 'النوع',
  //         values: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
  //         selectedValue: 'الكل',
  //       ),
  //       FilterOption(
  //         title: 'عدد الغرف',
  //         values: ['الكل', 'غرفتين', '3 غرف', '4 غرف', '5 غرف+'],
  //         selectedValue: 'الكل',
  //       ),
  //       FilterOption(
  //         title: 'طريقة الدفع',
  //         values: ['أي', 'كاش', 'تقسيط'],
  //         selectedValue: 'أي',
  //       ),
  //       FilterOption(
  //         title: 'حالة العقار',
  //         values: ['أي', 'جاهز', 'قيد الإنشاء'],
  //         selectedValue: 'أي',
  //       ),
  //     ];

  //     final batch = db.batch();
  //     for (final filter in defaultFilters) {
  //       batch.insert('filter_options', filter.toMap());
  //     }
  //     await batch.commit();
  //     print('✅ Default filter options inserted.');
  //   } else {
  //     print('ℹ️ Filters already exist, skip seeding.');
  //   }
  // }
}
