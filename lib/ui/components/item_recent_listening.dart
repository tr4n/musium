import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class ItemRecentListening extends StatelessWidget {
  String title = "";

  ItemRecentListening({super.key});

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
      width: 180,
      height: 180,
      margin: const EdgeInsets.only(right: 36),
      decoration: BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Sizes.size4),
      ),
      child: Image.network(
        "https://api.lorem.space/image/album?w=150&h=150",
        width: 180,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }
}
