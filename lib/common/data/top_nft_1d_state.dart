import 'package:egofly/common/models/top_nft_1d.dart';
import 'package:equatable/equatable.dart';

enum TopNFTTodayStatus { initial, loading, success, error }

class TopNFTTodayState extends Equatable {
  final TopNFTTodayStatus status;
  final List<TopNFT1D?> cryptoData;
  final String? errorMessage;

  const TopNFTTodayState({
    this.status = TopNFTTodayStatus.initial,
    required this.cryptoData,
    this.errorMessage,
  });

  factory TopNFTTodayState.initial() {
    return const TopNFTTodayState(
      status: TopNFTTodayStatus.initial,
      cryptoData: [],
    );
  }

  factory TopNFTTodayState.loading() {
    return const TopNFTTodayState(
      status: TopNFTTodayStatus.loading,
      cryptoData: [],
    );
  }

  factory TopNFTTodayState.success(List<TopNFT1D?> cryptoData) {
    return TopNFTTodayState(
      status: TopNFTTodayStatus.success,
      cryptoData: cryptoData,
    );
  }

  factory TopNFTTodayState.error(String errorMessage) {
    return TopNFTTodayState(
      status: TopNFTTodayStatus.error,
      errorMessage: errorMessage,
      cryptoData: const [],
    );
  }

  @override
  List<Object?> get props => [status, cryptoData, errorMessage];
}
