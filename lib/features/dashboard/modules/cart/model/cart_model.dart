class CartModel {
  String? id;
  String? image;
  String? name;
  double? totalPrice;
  int? itemCount;

  CartModel({
    this.id,
    this.image,
    this.name,
    this.totalPrice,
    this.itemCount,
  });

  CartModel.fromJson(
    Map map,
  ) {
    id = map['id'].toString();
    image = map['image'];
    name = map['name'];
    totalPrice = map['totalPrice'];
    itemCount = map['itemCount'];
  }
}
