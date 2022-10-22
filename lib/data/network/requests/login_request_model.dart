class LoginRequestModel {
  final String phone;
  final String name;

  LoginRequestModel({required this.phone, required this.name});

  factory LoginRequestModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LoginRequestModel(phone: json["phone"], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
    };
  }
}
