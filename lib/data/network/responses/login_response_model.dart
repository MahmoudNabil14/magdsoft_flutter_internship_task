class LoginResponseModel {
  late int status;
  late String message;
  late String? code;

  LoginResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    status = json["status"];
    message = json['message'];
    code = json['code'];
  }
}
