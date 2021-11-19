class Intro {
  String? title;
  String? description;
  String? image;

  Intro({this.title, this.description, this.image});

  Intro.fromMap(Map<String, dynamic> Map) {
    title = Map['title'];
    description = Map['description'];
    image = Map['image'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
