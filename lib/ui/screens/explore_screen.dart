import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musium/extension/context_ext.dart';

import '../../resources/resources.dart';
import '../components/components.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _textController = TextEditingController();

  _onSearchChanged(String text) {}

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
      _exploreBody(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 100,
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

  Widget _exploreBody() {
    return Column(
      children: [
        SizedBox(height: context.safeTopPadding + Sizes.size32),
        _header(),
        const SizedBox(height: Sizes.size28),
        _searchBar(),
      ],
    );
  }

  Widget _header() {
    return Row(
      children: [
        const SizedBox(width: Sizes.size40),
        BlendMask(
          opacity: 1.0,
          blendMode: BlendMode.screen,
          child: Image.asset(
            "assets/icons/ic_musium_logo.png",
            width: 48,
            height: 48,
          ),
        ),
        DefaultTextStyle(
            style: TextStyle(
                color: AppColor.blue41C3D6,
                fontSize: Sizes.size27,
                fontWeight: FontWeight.w700),
            child: Text("Search"))
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      // height: Sizes.size44,
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size22),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: AppColor.whiteD9D9D9,
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.size18))),
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Songs, Artists, Podcasts & More",
          prefixIcon: Icon(Icons.search,
              color: AppColor.gray979797, size: Sizes.size20),
          hintStyle:
              TextStyle(color: AppColor.gray8A9A9D, fontSize: Sizes.size13),
        ),
        textInputAction: TextInputAction.search,
        style: const TextStyle(fontSize: Sizes.size13, color: Colors.white),
        textAlignVertical: TextAlignVertical.center,
        onChanged: _onSearchChanged,
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
