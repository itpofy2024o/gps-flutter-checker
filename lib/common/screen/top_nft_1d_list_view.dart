import 'package:egofly/common/data/top_nft_1d_cubit.dart';
import 'package:egofly/common/data/top_nft_1d_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopNFTTodayListView extends StatefulWidget {
  const TopNFTTodayListView({super.key});

  @override
  State<TopNFTTodayListView> createState() => _TopNFTTodayListViewState();
}

class _TopNFTTodayListViewState extends State<TopNFTTodayListView>
    with WidgetsBindingObserver {
  DateTime? lastActive;

  @override
  void initState() {
    super.initState();
    context.read<TopNFTTodayCubit>().fetchCryptoData();
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
        context.read<TopNFTTodayCubit>().fetchCryptoData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<TopNFTTodayCubit, TopNFTTodayState>(
        builder: (context, state) {
          switch (state.status) {
            case TopNFTTodayStatus.initial || TopNFTTodayStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case TopNFTTodayStatus.error:
              return Text(state.errorMessage ?? 'Error');
            case TopNFTTodayStatus.success:
              final cryptoData = state.cryptoData;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(cryptoData[index]!.collection.toString()),
                      subtitle: Text(
                          "#trade: ${cryptoData[index]!.trades.toString()}"),
                    ),
                  );
                },
                itemCount: cryptoData.length,
              );
            default:
              return Container();
          }
        },
      ),
    ));
  }
}
