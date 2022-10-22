import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetProductsLoadingState extends HomeStates {}

class GetProductsSuccessState extends HomeStates {
  final List<ProductModel> productsList;

  GetProductsSuccessState({required this.productsList});
}

class GetProductsErrorState extends HomeStates {
  final String errorMessage;

  GetProductsErrorState({required this.errorMessage});
}
