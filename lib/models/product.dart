class Product {
  String? id;
  String? name;
  String? image;
  String? price;
  String? oldPrice;
  String? discount;
  String? isFavourite;
  double? rating;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.oldPrice,
      this.discount,
      this.rating,
      this.isFavourite = "0",
      this.isActive = "1",
      this.createdAt,
      this.updatedAt}) {
    createdAt = DateTime.now().toString();
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    oldPrice = json['oldPrice'];
    discount = json['discount'];
    rating = json['rating'];
    isFavourite = json['isFavourite'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['oldPrice'] = this.oldPrice;
    data['discount'] = this.discount;
    data['rating'] = this.rating;
    data['isActive'] = this.isActive;
    data['isFavourite'] = this.isFavourite;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
