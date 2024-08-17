import 'package:egofly/common/data/common_cubit.dart';
import 'package:egofly/common/data/common_state.dart';
import 'package:egofly/common/screen/error_screen.dart';
import 'package:egofly/common/screen/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<UserDataCubit>().fetchLoca();
  }

  @override
  Widget build(BuildContext context) {
    // return const TabView();
    return Scaffold(
        body: BlocConsumer<UserDataCubit, UserDataState>(
      listener: (context, state) {
        // if (state.status == UserDataStatus.gpsNull ||
        //     state.status == UserDataStatus.gpsNullForever) {
        //   context.read<UserDataCubit>().fetchLoca();
        // }
      },
      builder: (context, state) {
        print(state.status);
        switch (state.status) {
          // case UserDataStatus.initial:
          // case UserDataStatus.loading:
          //   print("dance");
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // case UserDataStatus.error:
          //   print("error");
          //   return Container(
          //       decoration: const BoxDecoration(color: Colors.amber),
          //       child: Text(state.errorMessage.toString()));
          // case UserDataStatus.success:
          //   return const TabView();
          // case UserDataStatus.gpsNull:
          // case UserDataStatus.gpsNullForever:
          // case UserDataStatus.blockList:
          //   print("strange");
          //   final String msg = state.errorMessage as String;
          //   return ErrorScreen(errorMsg: msg);
          // default:
          //   return Container(
          //     decoration: const BoxDecoration(color: Colors.blueAccent),
          //   );
          default:
            return const TabView();
        }
      },
    ));
  }
}
