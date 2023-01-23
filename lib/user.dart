class User {
  String name = '';
  String city = '';
  String image = '';

  User({required this.name, required this.city, required this.image});

  //convert json => User object
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    image = json['image'];
  }

  //converts User object => json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name'] = this.name;
    data['city'] = this.city;
    data['image'] = this.image;

    return data;
  }
}
