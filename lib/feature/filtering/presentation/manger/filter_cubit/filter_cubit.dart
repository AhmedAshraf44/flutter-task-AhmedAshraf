import 'package:bloc/bloc.dart';
import 'package:flutter_task/feature/filtering/data/repo/filter_repo_imple.dart';
import 'package:meta/meta.dart';

import '../../../data/model/filter_option.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitialState());
  final FilterRepoImple _repo = FilterRepoImple();
  Future<void> loadFilters() async {
    emit(FilterLoadingState());
    try {
      await _repo.seedData();
      final filters = await _repo.getAllFilters();
      emit(FilterSuccessState(filters));
    } catch (e) {
      emit(FilterFailureState(e.toString()));
    }
  }

  Future<void> addFilter(FilterOption filter) async {
    await _repo.insertFilter(filter);
    await loadFilters();
  }

  Future<void> updateFilter(FilterOption filter) async {
    try {
      await _repo.updateFilter(filter);
      await loadFilters();
    } catch (e) {
      emit(FilterFailureState(e.toString()));
    }
  }

  // Future<void> deleteFilter(String title) async {
  //   await _repo.deleteFilter(title);
  //   await loadFilters();
  // }
}
