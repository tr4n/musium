import 'package:flutter/material.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/screens/main_screen.dart';

import '../../resources/resources.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _onTapStart() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: "")));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: context.safeTopPadding),
        color: AppColor.blue41C3D6,
        child: _welcomeBody());
  }

  Widget _welcomeBody() {
    return Stack(
      children: [
        const SizedBox(width: double.infinity, height: double.infinity),
        Positioned(
          top: 124,
          child: Image.asset("assets/images/img_girl.png",
              width: context.getWidth(), height: 407),
        ),
        Positioned(
          child: Image.asset("assets/images/img_ellipse.png",
              width: 150, height: 150),
        ),
        Positioned(
          top: 46,
          right: 50,
          child: Image.asset("assets/images/img_ellipse.png",
              width: 78, height: 78),
        ),
        Positioned(
          top: 194,
          right: 25,
          child: Image.asset("assets/images/img_ellipse.png",
              width: 100, height: 100),
        ),
        Positioned(
          bottom: 0,
          child: _bottomIntroduction(),
        ),
      ],
    );
  }

  Widget _bottomIntroduction() {
    return Container(
      width: context.getWidth(),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(54),
          topRight: Radius.circular(54),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 60),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "From the ",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              children: [
                TextSpan(
                    text: "latest",
                    style: TextStyle(color: AppColor.blue41C3D6)),
                const TextSpan(text: " to the "),
                TextSpan(
                    text: "greatest",
                    style: TextStyle(color: AppColor.blue41C3D6)),
                const TextSpan(text: " hits, play your favorite tracks on "),
                TextSpan(
                    text: "musium",
                    style: TextStyle(color: AppColor.blue41C3D6)),
                const TextSpan(text: " now!"),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              const SizedBox(width: 90, height: 12),
              Positioned(
                  left: 0,
                  child:
                      Image.asset("assets/images/slider_blue.png", height: 15)),
              Positioned(
                  right: 0,
                  child:
                      Image.asset("assets/images/slider_white.png", height: 15))
            ],
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: _onTapStart,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 24),
              width: context.getWidth() * 0.8,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_button_blue.png"),
                    fit: BoxFit.cover),
              ),
              child: const DefaultTextStyle(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
                child: Text("Get Started"),
              ),
            ),
          ),
          SizedBox(height: context.safeBottomPadding + 24),
        ],
      ),
    );
  }
}
