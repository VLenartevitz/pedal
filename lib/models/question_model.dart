class QuestionModel {
  late String id;
  late String description;

  QuestionModel({
    required this.id,
    required this.description,

  });

  QuestionModel.fromMap(map) {
    id = map['id'];
    description = map['description'];

  }
}