import 'package:bloc/bloc.dart';
import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';

part 'crypto_activity_event.dart';
part 'crypto_activity_state.dart';

class CryptoActivityBloc
    extends Bloc<CryptoActivityEvent, CryptoActivityState> {
  late final CryptoRepository _cryptoRepository;

  static const List<String> cryptoSymbols = [
    "BTC",
    "ETH",
    "SOL",
    "XRP",
    "LTC",
    "DOT",
    "DOGE",
    "AVAX",
    "ADA"
  ];

  CryptoActivityBloc({required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(CryptoActivityState()) {
    on<CryptoActivityLoadCryptoChartEvent>(_onLoadCryptoChart);
  }

  Future<void> _onLoadCryptoChart(CryptoActivityLoadCryptoChartEvent event,
      Emitter<CryptoActivityState> emit) async {
    emit(CryptoActivityLoadingState());

    CryptocurrencyRepoPattern cryptoRepoPattern =
        await _cryptoRepository.getCryptoModels(cryptoSymbols: cryptoSymbols);

    switch (cryptoRepoPattern) {
      case (ApiException failure, null):
        return emit(CryptoActivityFailureState(failure: failure));
      case (null, final List<CryptoModel> resCryptoModels):
        return emit(CryptoActivityLoadedState(
          cryptoModels: resCryptoModels,
          cryptoSymbol: event.cryptoSymbol,
        ));
    }
  }
}
