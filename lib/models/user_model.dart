

class User{
  int? id;
  String? name;

  User({this.id,this.name});

  User.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];


  Map<String, dynamic> toMap() => {'id' : id, 'name' : name};
}