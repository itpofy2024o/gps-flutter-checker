import 'package:egofly/common/data/coin_data_cubit.dart';
import 'package:egofly/common/data/common_cubit.dart';
import 'package:egofly/common/data/top_nft_1d_cubit.dart';
import 'package:egofly/common/screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TopNFTTodayCubit>(create: (context) => TopNFTTodayCubit()),
    BlocProvider<CoinRankingDataCubit>(
        create: (context) => CoinRankingDataCubit()),
    BlocProvider<UserDataCubit>(
      create: (context) => UserDataCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EgoFly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TabScreen(),
    );
  }
}
