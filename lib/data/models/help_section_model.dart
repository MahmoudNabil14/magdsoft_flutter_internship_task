class HelpSectionModel {
  final int id;
  final String question;
  final String answer;

  HelpSectionModel(
      {required this.id, required this.question, required this.answer});

  factory HelpSectionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return HelpSectionModel(
        id: json["id"], question: json["question"], answer: json['answer']);
  }
}
