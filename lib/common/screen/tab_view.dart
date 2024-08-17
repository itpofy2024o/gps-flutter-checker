import 'package:egofly/common/screen/coin_basic_detail_list_view.dart';
import 'package:egofly/common/screen/top_nft_1d_list_view.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [CoinInfoListView(), TopNFTTodayListView()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabController.index,
          onTap: (index) {
            setState(() {
              _tabController.index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category 1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category 2'),
          ]),
    );
  }
}
