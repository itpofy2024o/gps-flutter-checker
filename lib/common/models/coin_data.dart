import 'package:json_annotation/json_annotation.dart';

part 'coin_data.g.dart';

@JsonSerializable()
class CoinRankingData {
  final String? uuid;
  final String? symbol;
  final String? name;
  final String? color;
  final String? iconUrl;
  final String? marketCap;
  final String? price;
  final String? coinrankingUrl;
  final String? oneDayVolume;
  final String? btcPrice;
  final int? rank;
  final String? change;
  final String? open;
  final String? high;
  final String? low;
  final String? close;
  final String? avg;

  CoinRankingData({
    this.uuid,
    this.symbol,
    this.name,
    this.color,
    this.iconUrl,
    this.marketCap,
    this.price,
    this.coinrankingUrl,
    this.oneDayVolume,
    this.btcPrice,
    this.rank,
    this.change,
    this.open,
    this.high,
    this.low,
    this.close,
    this.avg
  });

  factory CoinRankingData.fromJson(Map<String, dynamic> json) =>
      _$CoinRankingDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoinRankingDataToJson(this);
}
