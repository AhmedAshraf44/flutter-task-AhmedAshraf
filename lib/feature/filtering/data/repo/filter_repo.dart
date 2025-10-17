import '../model/filter_option.dart';

abstract class FilterRepo {
  Future<void> insertFilter(FilterOption filter);
  Future<List<FilterOption>> getAllFilters();
  Future<void> updateFilter(FilterOption filter);
}
