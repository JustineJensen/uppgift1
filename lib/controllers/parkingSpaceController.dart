import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/repositories/parkingSpaceRepository.dart';
import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/repositories/parkingSpaceRepository.dart';

class ParkingSpaceController {
  final ParkingSpaceRepository parkingSpaceRepository;

  ParkingSpaceController({required this.parkingSpaceRepository});

  ParkingSpace createParkingSpace(String adress, double pricePerHour) {
    ParkingSpace newSpace = ParkingSpace(id: 0, adress: adress, pricePerHour: pricePerHour);
    return parkingSpaceRepository.add(newSpace);
  }

  List<ParkingSpace> getAllParkingSpaces() {
    return parkingSpaceRepository.findAll();
  }

  ParkingSpace getParkingSpaceById(int id) {
    try {
      return parkingSpaceRepository.findById(id);
    } catch (e) {
      throw Exception("Fel: ${e.toString()}");
    }
  }

  void updateParkingSpace(int id, String newAdress, double newPricePerHour) {
    try {
      ParkingSpace updatedSpace = ParkingSpace(id: id, adress: newAdress, pricePerHour: newPricePerHour);
      parkingSpaceRepository.update(updatedSpace);
      print("Parkeringsplats med ID $id uppdaterad.");
    } catch (e) {
      print("Fel vid uppdatering: ${e.toString()}");
    }
  }

  // Ta bort en parkeringsplats
  void deleteParkingSpace(int id) {
    try {
      parkingSpaceRepository.deleteById(id);
      print("Parkeringsplats med ID $id har tagits bort.");
    } catch (e) {
      print("Fel vid borttagning: ${e.toString()}");
    }
  }
}
