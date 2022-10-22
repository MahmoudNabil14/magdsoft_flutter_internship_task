class HelpResponseModel {
  late int status;
  late String message;
  late List helpSections;

  HelpResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    status = json["status"];
    message = json['message'];
    helpSections = json['help'];
  }
}
