import 'dart:ui';

enum ExploreSection {
  charts(id: 0, title: "Charts", color: Color(0xff65b715)),
  podcasts(id: 1, title: "Podcasts", color: Color(0xff9E51F6)),
  newReleases(id: 0, title: "New Releases", color: Color(0xffb49622)),
  onlyYou(id: 0, title: "Only You", color: Color(0xff597CF5)),
  pop(id: 0, title: "Pop", color: Color(0xffEF7F8C)),
  kPop(id: 0, title: "K-Pop", color: Color(0xffF2A748)),
  rock(id: 0, title: "Rock", color: Color(0xff419389)),
  hipHop(id: 0, title: "Hip-Hop", color: Color(0xff75564A)),
  jazz(id: 0, title: "Jazz", color: Color(0xff657C88)),
  romance(id: 0, title: "Romance", color: Color(0xff52BAD0));

  final int id;
  final String title;
  final Color color;
  final String imagePath;

  const ExploreSection(
      {required this.id,
      required this.title,
      required this.color,
      this.imagePath = "assets/icons/ic_musium_logo.png"});
}
