import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class OTPResponseModel {
  late int status;
  late String message;
  AccountModel? accountModel;

  OTPResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    status = json["status"];
    message = json['message'];
    accountModel = json['data'];
  }
}
