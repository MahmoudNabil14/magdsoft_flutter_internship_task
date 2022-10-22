class ProductsResponseModel {
  late int status;
  late String message;
  late List productsList;

  ProductsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    status = json["status"];
    message = json['message'];
    productsList = json['products'];
  }
}
