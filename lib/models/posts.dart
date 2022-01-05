class Posts {
  final int id;
  final String? modified;
  final String title;
  final String? featuredImage;
  Posts({required this.id, this.modified,required this.title, this.featuredImage});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        id: json['id'],
        modified: json['modified'],
        title: json['title'],
        featuredImage: json['featured_image']['url']);
  }
}
