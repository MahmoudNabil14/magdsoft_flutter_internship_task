import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home%20cubit/home_states.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/products_response_model.dart';

import '../../data/data_providers/remote/error/exceptions.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getProducts() async {
    try {
      final Response response =
          await DioHelper().get(path: getProductsEndPoint);
      final ProductsResponseModel productsResponseModel =
          ProductsResponseModel.fromJson(response.data);
      if (productsResponseModel.status == 200) {
        List<ProductModel> productsList = [];
        for (var product in productsResponseModel.productsList) {
          productsList.add(ProductModel.fromJson(product));
        }
        emit(GetProductsSuccessState(productsList: productsList));
      } else {
        emit(
            GetProductsErrorState(errorMessage: productsResponseModel.message));
      }
    } on ServerException catch (exception) {
      emit(GetProductsErrorState(errorMessage: exception.message!));
    }
  }
}
