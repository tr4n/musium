import 'package:flutter/material.dart';
import 'package:musium/common/type/main_tab.dart';
import 'package:musium/ui/screens/screens.dart';
import 'package:musium/ui/screens/welcome_screen.dart';

import '../../resources/app_sizes.dart';
import '../../resources/colors.dart';
import '../components/components.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "gothic",
        primaryColor: Colors.white,
        brightness: Brightness.light,
        primaryColorDark: Colors.black,
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  final _screens = [
    ScreenTab(MainTab.home, const HomeScreen()),
    ScreenTab(MainTab.explore, const ExploreScreen()),
    ScreenTab(MainTab.library, const LibraryScreen())
  ];

  Color _getSelectedColor(int index) {
    return _selectedTab == index ? AppColor.blue41C3D6 : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _screens[_selectedTab].page,
          bottomNavigationBar: BottomNavigationBar(
            items: _screens
                .map(
                  (screen) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(Sizes.size8),
                      child: Image.asset(
                        screen.tab.iconPath,
                        width: 24,
                        height: 24,
                        color: _getSelectedColor(screen.tab.id),
                      ),
                    ),
                    label: screen.tab.name,
                  ),
                )
                .toList(),
            onTap: (index) => _selectedTab = index,
            currentIndex: _selectedTab,
            selectedItemColor: AppColor.blue41C3D6,
            backgroundColor: Colors.black,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: double.infinity,
            height: 500,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
