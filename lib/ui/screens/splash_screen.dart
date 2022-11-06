import 'package:flutter/material.dart';
import 'package:musium/ui/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Image.asset("assets/images/img_splash.png"),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Navigator.push(context, MaterialPageRoute(builder: (_) => const MyApp()));
  }
}
