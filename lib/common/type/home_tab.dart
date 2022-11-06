enum HomeTab {
  nowPlaying(0, "Now playing"),
  upcoming(1, "Upcoming"),
  topRated(2, "Top rated"),
  popular(3, "Popular");

  final int id;
  final String name;

  const HomeTab(this.id, this.name);
}
