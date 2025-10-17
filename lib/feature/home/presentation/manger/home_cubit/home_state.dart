part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {
  final List<CategoryModel> categories;
  final List<CategoryModel> selections;
  final List<ProductModel> products;

  HomeSucessState({
    required this.categories,
    required this.selections,
    required this.products,
  });
}

class HomeFailureState extends HomeState {
  final String message;
  HomeFailureState(this.message);
}
