import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musium/common/common.dart';
import 'package:musium/common/type/main_tab.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/components/components.dart';
import 'package:musium/ui/screens/screens.dart';

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
    return  Container(
      padding: EdgeInsets.only(top: context.safeTopPadding),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Text("Home"),
    );
  }
}
