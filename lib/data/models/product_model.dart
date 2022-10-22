class ProductModel {
  final int productId;
  final String productCompany;
  final String productModel;
  final String productType;
  final String productPrice;
  final String productImage;
  final String productDescription;

  ProductModel(
      {required this.productId,
      required this.productCompany,
      required this.productModel,
      required this.productType,
      required this.productPrice,
      required this.productImage,
      required this.productDescription});

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel(
      productId: json["id"],
      productCompany: json["company"],
      productModel: json['name'],
      productType: json["type"],
      productPrice: json["price"],
      productImage: json['image'],
      productDescription: json['description'],
    );
  }

  //to send the object as argument while navigating
  Map<String, dynamic> toMap() {
    return {
      "id": productId,
      "company": productCompany,
      "name": productModel,
      "type": productType,
      "price": productPrice,
      "image": productImage,
      "description": productDescription,
    };
  }
}
