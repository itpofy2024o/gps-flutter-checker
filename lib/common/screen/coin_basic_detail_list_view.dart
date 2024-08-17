import 'package:egofly/common/data/coin_data_cubit.dart';
import 'package:egofly/common/data/coin_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinInfoListView extends StatefulWidget {
  const CoinInfoListView({super.key});

  @override
  State<CoinInfoListView> createState() => _CoinInfoListViewState();
}

class _CoinInfoListViewState extends State<CoinInfoListView>
    with WidgetsBindingObserver {
  DateTime? lastActive;

  @override
  void initState() {
    super.initState();
    context.read<CoinRankingDataCubit>().fetchCoins();
    WidgetsBinding.instance.addObserver(this);
    checkLastActive();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void appLifeCycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      lastActive = DateTime.now();
      checkLastActive();
    }
  }

  void checkLastActive() {
    if (lastActive != null) {
      final Duration timeDifference = DateTime.now().difference(lastActive!);
      if (timeDifference >= const Duration(minutes: 30)) {
        context.read<CoinRankingDataCubit>().fetchCoins();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<CoinRankingDataCubit, CoinRankingDataState>(
        builder: (context, state) {
          switch (state.status) {
            case CoinRankingDataStatus.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CoinRankingDataStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CoinRankingDataStatus.error:
              return Text(state.errorMessage ?? 'Error');
            case CoinRankingDataStatus.success:
              final cryptoData = state.cryptoData;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  switch (cryptoData[index]!.name) {
                    case "Dai" ||
                          "Tether USD" ||
                          "USDC" ||
                          "Wrapped BTC" ||
                          "Wrapped Ether" ||
                          "USDe":
                      return const SizedBox.shrink();
                    default:
                      return Card(
                        child: ListTile(
                          trailing: GestureDetector(
                            onTap: () {
                              print("tapped: ${cryptoData[index]!.symbol}");
                            },
                            child: const Icon(Icons.trending_up_sharp),
                          ),
                          title: Text(cryptoData[index]!.name.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w800)),
                          subtitle: Text(
                              "Cap: ${cryptoData[index]!.marketCap.toString()}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      );
                  }
                },
                itemCount: cryptoData.length,
              );
            default:
              return Container();
          }
        },
      )),
    );
  }
}
