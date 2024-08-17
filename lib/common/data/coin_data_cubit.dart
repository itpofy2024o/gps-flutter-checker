import 'package:egofly/common/data/coin_data_state.dart';
import 'package:egofly/common/models/coin_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CoinRankingDataCubit extends Cubit<CoinRankingDataState> {
  CoinRankingDataCubit() : super(CoinRankingDataState.initial());

  Future<void> fetchCoins() async {
    await dotenv.load(fileName: ".env");
    try {
      emit(CoinRankingDataState.loading());
      Dio dio = Dio();
      const params = {
        "referenceCurrencyUuid": "yhjMzLPhuIDl",
        "timePeriod": "24h",
        "tiers[0]": "1",
        "orderBy": "marketCap",
        "orderDirection": "desc",
        "limit": "50",
        "offset": "0"
      };
      final res = await dio.get("https://coinranking1.p.rapidapi.com/coins",
          queryParameters: params,
          options: Options(headers: {
            "X-RapidAPI-Key": dotenv.env["RAPIDAPI"],
            "X-RapidAPI-Host": "coinranking1.p.rapidapi.com",
          }));
      final List<dynamic> responseData = res.data["data"]["coins"];
      final List<CoinRankingData?> data = responseData.map((item) {
        if (item == null) {
          return null;
        }
        return CoinRankingData.fromJson(item as Map<String, dynamic>);
      }).toList();
      emit(CoinRankingDataState.success(data));
    } catch (e) {
      emit(CoinRankingDataState.error(e.toString()));
      print(e.toString());
    }
  }

  Future<void> fetchOHLC(String uuid) async {
    await dotenv.load(fileName: ".env");
    try {
      emit(CoinRankingDataState.loading());
      Dio dio = Dio();
      const params = {
        "referenceCurrencyUuid": "yhjMzLPhuIDl",
        "interval": "day"
      };
      final res =
          await dio.get("https://coinranking1.p.rapidapi.com/coin/$uuid/ohlc",
              queryParameters: params,
              options: Options(headers: {
                "X-RapidAPI-Key": dotenv.env["RAPIDAPI"],
                "X-RapidAPI-Host": "coinranking1.p.rapidapi.com",
              }));
      final List<dynamic> responseData = res.data;
      final List<CoinRankingData?> data = responseData.map((item) {
        if (item == null) {
          return null;
        }
        return CoinRankingData.fromJson(item as Map<String, dynamic>);
      }).toList();
      emit(CoinRankingDataState.success(data));
    } catch (e) {
      emit(CoinRankingDataState.error(e.toString()));
      print(e.toString());
    }
  }
}
