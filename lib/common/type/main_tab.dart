enum MainTab {
  home(0, "Home", "assets/icons/ic_home.png"),
  explore(1, "Explore", "assets/icons/ic_explore.png"),
  library(2, "Library", "assets/icons/ic_library.png");

  final int id;
  final String name;
  final String iconPath;

  const MainTab(this.id, this.name, this.iconPath);
}
