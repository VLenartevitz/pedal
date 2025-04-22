class BikeModel {
  late int bike_type_id;
  late String nickname;
  // late int strava_id;
  // late String brand;
  // late String model;
  // late int weight;
  // late int year;
  // late int buy_date;
  // late String notes;

  BikeModel({
    required this.bike_type_id,
    required this.nickname,
    // required this.strava_id,
    // required this.brand,
    // required this.model,
    // required this.weight,
    // required this.year,
    // required this.buy_date,
    // required this.notes
  });

  BikeModel.fromMap(map){
    bike_type_id = map['bike_type_id'];
    nickname = map['nickname'];
    // strava_id = map['strava_id'];
    // brand = map['brand'];
    // model = map['model'];
    // weight = map['weight'];
    // year = map['year'];
    // buy_date = map['buy_date'];
    // notes = map['notes'];

  }
}
