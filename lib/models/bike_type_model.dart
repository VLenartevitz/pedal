class BikeTypeModel {
  late int id;
  late String name;

  BikeTypeModel({
    required this.id,
    required this.name,

  });

  BikeTypeModel.fromMap( map) {
    id = map["id"];
    name = map['name'];
  }
}