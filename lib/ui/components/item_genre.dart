import 'package:flutter/material.dart';

import '../../common/type/explore_sections.dart';
import '../../resources/resources.dart';
import 'components.dart';

class ItemExplore extends StatelessWidget {
  ExploreSection section;

  ItemExplore(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: Sizes.size16, left: Sizes.size16),
        decoration: BoxDecoration(
          color: section.color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Sizes.size24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size18,
                    fontWeight: FontWeight.w700),
                child: Text(section.title, textAlign: TextAlign.start),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: _rotatedImage(),
              ),
            ),
          ],
        ));
  }

  Widget _rotatedImage() {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          right: -15,
          bottom: -15,
          child:  RotationTransition(
            turns: const AlwaysStoppedAnimation(-50 / 360),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.size12),
              child: Image.network(
                "https://api.lorem.space/image/album?w=150&h=${150 + section.id}",
                width: Sizes.size90,
                height: Sizes.size90,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
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
