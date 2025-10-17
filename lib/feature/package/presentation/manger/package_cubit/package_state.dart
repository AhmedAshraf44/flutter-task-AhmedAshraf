part of 'package_cubit.dart';

sealed class PackageState {}

final class PackageInitial extends PackageState {}

class PackageLoadingState extends PackageState {}

class PackageSuccessState extends PackageState {
  final List<PackageModel> packages;
  PackageSuccessState(this.packages);
}

class PackageFailureState extends PackageState {
  final String message;
  PackageFailureState(this.message);
}
