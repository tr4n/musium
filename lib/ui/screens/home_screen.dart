import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musium/common/type/main_tab.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/components/components.dart';
import 'package:musium/ui/components/item_listening.dart';
import 'package:musium/ui/components/item_recent_listening.dart';
import 'package:musium/ui/components/item_top_mix.dart';
import 'package:musium/ui/screens/screens.dart';

import '../../resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  final _screens = [
    ScreenTab(MainTab.home, const HomeScreen()),
    ScreenTab(MainTab.explore, const ExploreScreen()),
    ScreenTab(MainTab.library, const LibraryScreen())
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
      Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black12,
              Color(0x1A0E0E0E),
              Color(0xb3102b2d),
              Color(0xb306a0b5),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        // color: Colors.red,
      ),
      _homeBody(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xE6000000),
                Color(0x99000000),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          // color: Colors.red,
        ),
      ),
    ]);
  }

  Widget _homeBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.safeTopPadding),
          _actionBar(),
          const SizedBox(height: Sizes.size32),
          _continueListening(),
          const SizedBox(height: Sizes.size32),
          _yourTopMixes(),
          const SizedBox(height: Sizes.size32),
          _basedOnYourRecentListening(),
        ],
      ),
    );
  }

  Widget _actionBar() {
    return Row(
      children: [
        const SizedBox(width: Sizes.size24),
        Container(
          height: 34,
          width: 34,
          padding: const EdgeInsets.all(2),
          // Border width
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff158085),
                Color(0xff00DBFC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child:
                  Image.network("https://i.pravatar.cc/100", fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: Sizes.size16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("Welcome back !")),
              DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: Sizes.size12),
                  child: Text("chandrama"))
            ],
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Image.asset("assets/icons/ic_bar.png", width: 20, height: 20),
        ),
        IconButton(
          onPressed: null,
          icon: Image.asset("assets/icons/ic_bell.png", width: 20, height: 20),
        ),
        IconButton(
          onPressed: null,
          icon: Image.asset("assets/icons/ic_settings.png",
              width: 20, height: 20),
        ),
        const SizedBox(width: Sizes.size24),
      ],
    );
  }

  Widget _continueListening() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text("Continue Listening", textAlign: TextAlign.start),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: Sizes.size8,
            crossAxisSpacing: Sizes.size12,
            scrollDirection: Axis.vertical,
            childAspectRatio: 180 / 50,
            children: [0, 1, 2, 3, 4, 5].map((e) => ItemListening()).toList(),
          ),
        ],
      ),
    );
  }

  Widget _yourTopMixes() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text("Your Top Mixes", textAlign: TextAlign.start),
          ),
          const SizedBox(height: Sizes.size8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3, 4, 5, 6].map((e) => ItemTopMix()).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _basedOnYourRecentListening() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text("Based on your recent listening",
                textAlign: TextAlign.start),
          ),
          const SizedBox(height: Sizes.size12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  [0, 1, 2, 3, 4, 5].map((e) => ItemRecentListening()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
