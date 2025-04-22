import 'package:pedalserviceapp/repositories/bike_repository.dart';

class BikeController {
  var bikeRepository = BikeRepository();
  void store(int bikeTypeId, String nickname, String model, String weight, String year, String buy_date, String notes, ) async {
    try {
      await bikeRepository.store(bikeTypeId,  nickname, model, weight, year, buy_date, notes );
    } catch (e) {
      e.toString();
    }
  }
}
