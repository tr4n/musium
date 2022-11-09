import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class ItemListening extends StatelessWidget {
  String title = "";

  ItemListening({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: const Color(0x4D436369)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://picsum.photos/200/300",
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: Sizes.size16),
          const Expanded(
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size10,
                fontWeight: FontWeight.w700,
              ),
              child: Text("Coffee & Jazz"),
            ),
          )
        ],
      ),
    );
  }
}
