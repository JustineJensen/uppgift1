import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/car.dart';
import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicle.dart';
import 'package:uppgift1/models/vehicleType.dart';
import 'package:uppgift1/repositories/vehicleRepository.dart';

class VehicleController {
  final VehicleRepository vehicleRepository;

  VehicleController({required this.vehicleRepository});

  // Skapa ett nytt fordon
  Vehicle createVehicle(String registreringsNummer, VehicleType typ, Person owner, String color) {
    Vehicle newVehicle = Car(
      id: 0,
      registreringsNummer: registreringsNummer,
      typ: typ,
      owner: owner,
      color: color,
    );
    return vehicleRepository.add(newVehicle);
  }


  List<Vehicle> getAllVehicles() {
    return vehicleRepository.findAll();
  }

  Vehicle getVehicleById(int id) {
    try {
      return vehicleRepository.findById(id);
    } catch (e) {
      throw Exception("Fel: ${e.toString()}");
    }
  }

  // Uppdatera fordon
  void updateVehicle(int id, String newRegNum, VehicleType newTyp, Person newOwner,String newColor) {
    try {
      Vehicle updatedVehicle = Car(id: id, registreringsNummer: newRegNum, typ: newTyp, owner: newOwner,color:newColor);
      vehicleRepository.update(updatedVehicle);
      print("Fordon med ID $id uppdaterat.");
    } catch (e) {
      print("Fel vid uppdatering: ${e.toString()}");
    }
  }

  // Ta bort ett fordon
  void deleteById(int id) {
    try {
      vehicleRepository.deleteById(id);
      print("Fordon med ID $id har tagits bort.");
    } catch (e) {
      print("Fel vid borttagning: ${e.toString()}");
    }
  }

  void deleteVehicle(String registreringsNummer) {
  Vehicle? vehicleToDelete = vehicleRepository.findByRegNum(registreringsNummer);

  if (vehicleToDelete == null) {
    print("\nFel: Fordonet kunde inte tas bort eftersom det inte hittades!");
    return;
  }

  vehicleRepository.deleteById(vehicleToDelete.id);
  print("\nFordon med registreringsnummer '$registreringsNummer' har tagits bort.");
}

}