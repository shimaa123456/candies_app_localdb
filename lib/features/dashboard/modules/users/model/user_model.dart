class UserModel {
  String? id;
  String? name;
  String? address;
  String? phone;

  UserModel({this.id, this.address, this.name, this.phone});

  UserModel.fromJson(Map map) {
    id = map['id'].toString();
    name = map['name'];
    address = map['address'];
    phone = map['phone'];
  }
}
