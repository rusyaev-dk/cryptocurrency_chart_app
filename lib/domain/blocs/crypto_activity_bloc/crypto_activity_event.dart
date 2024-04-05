part of 'crypto_activity_bloc.dart';

class CryptoActivityEvent {}

class CryptoActivityLoadCryptoChartEvent extends CryptoActivityEvent {
  final String cryptoSymbol;

  CryptoActivityLoadCryptoChartEvent({required this.cryptoSymbol});
}
