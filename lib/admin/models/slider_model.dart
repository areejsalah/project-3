class Slider {
  String? id;
  String imageUrl;
  String title;
  String url;
  Slider({
    this.id,
    required this.imageUrl,
    required this.title,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'url': url,
    };
  }

  factory Slider.fromMap(Map<String, dynamic> map) {
    return Slider(
      imageUrl: map['imageUrl'],
      title: map['title'],
      url: map['url'],
    );
  }
}
