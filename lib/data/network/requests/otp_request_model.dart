class OTPRequestModel {
  final String code;
  final String phone;

  OTPRequestModel({required this.code, required this.phone});

  factory OTPRequestModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return OTPRequestModel(code: json["code"], phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'phone': phone,
    };
  }
}
