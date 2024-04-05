part of 'crypto_activity_bloc.dart';

class CryptoActivityState {}

class CryptoActivityLoadingState extends CryptoActivityState {}

class CryptoActivityLoadedState extends CryptoActivityState {
  final String cryptoSymbol;
  final List<CryptoModel> cryptoModels;

  CryptoActivityLoadedState({
    required this.cryptoSymbol,
    required this.cryptoModels,
  });
}

class CryptoActivityFailureState extends CryptoActivityState {
  final ApiException failure;

  CryptoActivityFailureState({required this.failure});
}
