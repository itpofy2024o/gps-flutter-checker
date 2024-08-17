import 'package:egofly/common/models/top_nft_1d.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:egofly/common/data/top_nft_1d_state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TopNFTTodayCubit extends Cubit<TopNFTTodayState> {
  TopNFTTodayCubit() : super(TopNFTTodayState.initial());

  Future<void> fetchCryptoData() async {
    await dotenv.load(fileName: ".env");
    try {
      emit(TopNFTTodayState.loading());
      Dio dio = Dio();
      final res =
          await dio.get("https://top-nft-sales.p.rapidapi.com/collections/1d",
              options: Options(headers: {
                "X-RapidAPI-Key": dotenv.env["RAPIDAPI"],
                "X-RapidAPI-Host": "top-nft-sales.p.rapidapi.com",
              }));
      final List<TopNFT1D?> data = (res.data as List<dynamic>?)!.map((item) {
        if (item == null) {
          return null;
        }
        print(item);
        return TopNFT1D.fromJson(item as Map<String, dynamic>);
      }).toList();
      emit(TopNFTTodayState.success(data));
    } catch (e) {
      emit(TopNFTTodayState.error(e.toString()));
    }
  }
}
