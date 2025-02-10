import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/parking.dart';
import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/models/vehicle.dart';
import 'package:uppgift1/repositories/parkingRepository.dart';

class ParkingController {
  final ParkingRepository _parkingRepository;

  ParkingController(this._parkingRepository); 
  void createParking(Vehicle vehicle, ParkingSpace parkingSpace, DateTime startTime, {DateTime? endTime}) {
    Parking newParking = Parking(
      id: _parkingRepository.getNextId(),
      fordon: vehicle,
      parkingSpace: parkingSpace,
      startTime: startTime,
      endTime: endTime,
    );
    _parkingRepository.add(newParking);
    print('Ny parkering skapad: $newParking');
  }
  void listAllParking(){
    List<Parking> allParkings =_parkingRepository.findAll();
    if(allParkings.isEmpty){
      print("Inga parkering hittades");
    }else{
      allParkings.forEach((parking) {
        print(parking);
      });
      }
    }
  void updateParking(Parking updatedParking) {
    try {
      _parkingRepository.update(updatedParking);
      print('Parkering uppdaterad: $updatedParking');
    } catch (e) {
      print('Fel: ${e.toString()}');
    }
  }
  void deleteParking(int id){
    try{
      _parkingRepository.deleteById(id);
      print("Parking med ID $id har tagits bort");
    }catch(e){
      print("Fel: ${e.toString()}");
    }

  }
}
   
  

  
  
  