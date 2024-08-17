import 'package:json_annotation/json_annotation.dart';

part 'top_nft_1d.g.dart';

@JsonSerializable()
class TopNFT1D {
  final String? collection;
  final String? collectionUrl;
  final String? trades;
  final String? volume;

  TopNFT1D({this.collection, this.collectionUrl, this.trades, this.volume});

  factory TopNFT1D.fromJson(Map<String, dynamic> json) =>
      _$TopNFT1DFromJson(json);

  Map<String, dynamic> toJson() => _$TopNFT1DToJson(this);
}
