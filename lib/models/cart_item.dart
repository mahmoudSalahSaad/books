class CartItemModel {
  int id, quantity;
  double price, firstAddonPrice, secondAddonPrice;
  String name, description, weight, firstAddonName, secondAddonName, photoUrl;

  CartItemModel({
    this.id,
    this.quantity,
    this.price,
    this.firstAddonPrice = 0.0,
    this.secondAddonPrice = 0.0,
    this.name,
    this.description,
    this.weight,
    this.firstAddonName,
    this.secondAddonName,
    this.photoUrl,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'],
      firstAddonPrice: json['firstAddonPrice'],
      secondAddonPrice: json['secondAddonPrice'],
      name: json['name'],
      description: json['description'],
      weight: json['weight'],
      firstAddonName: json['firstAddonName'],
      secondAddonName: json['secondAddonName'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['firstAddonPrice'] = this.firstAddonPrice;
    data['secondAddonPrice'] = this.secondAddonPrice;
    data['name'] = this.name;
    data['description'] = this.description;
    data['weight'] = this.weight;
    data['firstAddonName'] = this.firstAddonName;
    data['secondAddonName'] = this.secondAddonName;
    return data;
  }
}
