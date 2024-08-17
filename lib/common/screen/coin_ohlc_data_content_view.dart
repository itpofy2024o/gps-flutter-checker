import 'package:egofly/common/data/coin_data_cubit.dart';
import 'package:egofly/common/data/coin_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinOHLCView extends StatefulWidget {
  final String coinUuid;
  const CoinOHLCView({super.key, required this.coinUuid});

  @override
  State<CoinOHLCView> createState() => _CoinOHLCViewState();
}

class _CoinOHLCViewState extends State<CoinOHLCView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<CoinRankingDataCubit, CoinRankingDataState>(
        builder: (context, state) {
          switch (state.status) {
            case CoinRankingDataStatus.initial:
              context.read<CoinRankingDataCubit>().fetchOHLC(widget.coinUuid);
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
              return Container();
            default:
              return Container();
          }
        },
      )),
    );
  }
}
