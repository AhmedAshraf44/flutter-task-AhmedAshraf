part of 'filter_cubit.dart';

@immutable
sealed class FilterState {}

final class FilterInitialState extends FilterState {}

class FilterLoadingState extends FilterState {}

class FilterSuccessState extends FilterState {
  final List<FilterOption> filters;
  FilterSuccessState(this.filters);
}

class FilterFailureState extends FilterState {
  final String message;
  FilterFailureState(this.message);
}
