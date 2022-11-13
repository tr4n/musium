import 'package:flutter/material.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/screens/screens.dart';

import '../../resources/resources.dart';
import '../components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _onTapStart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: context.safeTopPadding),
        color: AppColor.gray1E1E1E,
        child: _welcomeBody());
  }

  Widget _welcomeBody() {
    return Column(
      children: [
        SizedBox(height: context.safeTopPadding),
        _logoImage(),
        const SizedBox(height: Sizes.size48),
        const DefaultTextStyle(
          style: TextStyle(
              color: Colors.white, fontSize: 44, fontWeight: FontWeight.w700),
          child: Text(
            "Let's get you in Spotify",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: Sizes.size48),
        GestureDetector(
          onTap: _onTapStart,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 24),
            width: context.getWidth() * 0.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_button_blue.png"),
                  fit: BoxFit.cover),
            ),
            child: const DefaultTextStyle(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              child: Text("Login with Spotify"),
            ),
          ),
        ),
        SizedBox(height: context.safeBottomPadding + 24),
      ],
    );
  }

  Widget _logoImage() {
    return BlendMask(
      opacity: 1.0,
      blendMode: BlendMode.screen,
      child: Image.asset("assets/images/logo_app_512.png",
          width: context.getWidth() * 0.6, fit: BoxFit.cover),
    );
  }
}
