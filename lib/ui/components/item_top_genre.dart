import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class ItemTopMix extends StatelessWidget {
  String title = "";

  ItemTopMix({super.key});

  final List<Color> _colors = [
    const Color(0xFFFF7777),
    const Color(0xFFFFFA77),
    const Color(0xFF77FF95),
    const Color(0xFF777EFF),
    const Color(0xFF783B8C),
    const Color(0xFF8C3B3B),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.size32),
      child: Stack(
        children: [
          Image.network(
            "https://api.lorem.space/image/album?w=150&h=150",
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Positioned(left: -13, child: _circle(Sizes.size26)),
          Positioned(right: -34, top: 50, child: _circle(68)),
          Positioned(
            bottom: 0,
            child: Container(
              height: 10,
              width: 150,
              color: _colors[Random().nextInt(_colors.length)],
            ),
          ),
          const Positioned(
            top: 8,
            left: 24,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: Text("Pop Mix", textAlign: TextAlign.start),
            ),
          )
        ],
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration:
          const BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
    );
  }
}
