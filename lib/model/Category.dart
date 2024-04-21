class Category {
  final String id;
  final String name;
  final String url;

  Category({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
