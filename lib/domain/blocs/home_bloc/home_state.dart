part of 'home_bloc.dart';

class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<CryptoModel> cryptoModels;

  HomeLoadedState({required this.cryptoModels});
}

class HomeFailureState extends HomeState {
  final ApiException failure;

  HomeFailureState({required this.failure});
}
