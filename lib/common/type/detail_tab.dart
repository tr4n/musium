enum DetailTab {
  aboutMovie(0, "About Movie"),
  reviews(1, "Reviews"),
  cast(2, "Cast"),
  similar(3, "Similar");


  final int id;
  final String name;

  const DetailTab(this.id, this.name);
}
