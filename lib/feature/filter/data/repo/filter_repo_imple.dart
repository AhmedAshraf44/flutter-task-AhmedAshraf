import 'package:flutter_task/feature/filter/data/repo/filter_repo.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/dao/filter_dao.dart';
import '../model/filter_option.dart';

class FilterRepoImple implements FilterRepo {
  FilterRepoImple(this._dao);
  final FilterDao _dao;
  Future<bool> _isTableEmpty(String tableName) async {
    final db = await AppDatabase.database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $tableName'),
    );
    return (count ?? 0) == 0;
  }

  Future<void> seedData() async {
    final isFilterEmpty = await _isTableEmpty('filter_options');

    if (isFilterEmpty) {
      for (final filter in FilterOption.filterList) {
        await _dao.insertFilter(filter);
      }
    }
  }

  @override
  Future<void> insertFilter(FilterOption filter) async {
    await _dao.insertFilter(filter);
  }

  @override
  Future<List<FilterOption>> getAllFilters() async {
    return await _dao.getAllFilters();
  }

  @override
  Future<void> updateFilter(FilterOption filter) async {
    if (filter.id != null && filter.selectedValue != null) {
      await _dao.updateSelectedValue(filter.id!, filter.selectedValue!);
    }
  }
}
