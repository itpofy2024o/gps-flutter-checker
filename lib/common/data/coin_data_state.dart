import 'package:egofly/common/models/coin_data.dart';
import 'package:equatable/equatable.dart';

enum CoinRankingDataStatus { initial, loading, success, error }

class CoinRankingDataState extends Equatable {
  final CoinRankingDataStatus status;
  final List<CoinRankingData?> cryptoData;
  final String? errorMessage;

  const CoinRankingDataState({
    this.status = CoinRankingDataStatus.initial,
    required this.cryptoData,
    this.errorMessage,
  });

  factory CoinRankingDataState.initial() {
    return const CoinRankingDataState(
      status: CoinRankingDataStatus.initial,
      cryptoData: [],
    );
  }

  factory CoinRankingDataState.loading() {
    return const CoinRankingDataState(
      status: CoinRankingDataStatus.loading,
      cryptoData: [],
    );
  }

  factory CoinRankingDataState.success(List<CoinRankingData?> cryptoData) {
    return CoinRankingDataState(
      status: CoinRankingDataStatus.success,
      cryptoData: cryptoData,
    );
  }

  factory CoinRankingDataState.error(String errorMessage) {
    return CoinRankingDataState(
      status: CoinRankingDataStatus.error,
      errorMessage: errorMessage,
      cryptoData: const [],
    );
  }

  @override
  List<Object?> get props => [status, cryptoData, errorMessage];
}
