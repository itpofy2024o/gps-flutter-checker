// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinRankingData _$CoinRankingDataFromJson(Map<String, dynamic> json) =>
    CoinRankingData(
      uuid: json['uuid'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      iconUrl: json['iconUrl'] as String?,
      marketCap: json['marketCap'] as String?,
      price: json['price'] as String?,
      coinrankingUrl: json['coinrankingUrl'] as String?,
      oneDayVolume: json['24hVolume'] as String?,
      btcPrice: json['btcPrice'] as String?,
      rank: json['rank'] as int?,
      change: json['change'] as String?,
      open: json['open'] as String?,
      high: json['high'] as String?,
      low: json['low'] as String?,
      close: json['close'] as String?,
      avg: json['avg'] as String?,
    );

Map<String, dynamic> _$CoinRankingDataToJson(CoinRankingData instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'symbol': instance.symbol,
      'name': instance.name,
      'color': instance.color,
      'iconUrl': instance.iconUrl,
      'marketCap': instance.marketCap,
      'price': instance.price,
      'coinrankingUrl': instance.coinrankingUrl,
      'oneDayVolume': instance.oneDayVolume,
      'btcPrice': instance.btcPrice,
      'rank': instance.rank,
      'change': instance.change,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'avg': instance.avg,
    };
