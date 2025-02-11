import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/parking.dart';
import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/models/vehicle.dart';
import 'package:uppgift1/repositories/parkingRepository.dart';
import 'package:intl/intl.dart';


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
  
  List<Parking>listAllParking(){

    List<Parking> allParkings =_parkingRepository.findAll();
    if(allParkings.isEmpty){
      print("Inga parkering hittades");
    }else{
      allParkings.forEach((parking) {
        print(parking);
      });
      }
      return allParkings;
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
  void findParkingById(int id){
    try{
      Parking parking = _parkingRepository.findById(id);
      print("\n Parking hittade: $parking");
    }catch(e){
      print("\n Fel:${e.toString()}");
    }
  }
  double calculateParkingCost(int parkerId,String endTimeStr){
    try{
      Parking parking = _parkingRepository.findById(parkerId);
      if(parking.endTime == null){
        print("Fel: Parkeringen är forfarnde aktiv. Avsluta parkering först");
        return 0.0;
      }
      DateFormat format = DateFormat("yyyy-MM-dd HH:mm");
      DateTime endTime = format.parse(endTimeStr);
      
      parking.endTime = endTime;

      Duration duration = parking.endTime!.difference(parking.startTime);
      
      double hours = duration.inMinutes/60;
      double roundedHours = (hours <=1) ? 1.0: hours;

      double totalCost = roundedHours*parking.parkingSpace.pricePerHour;
      return totalCost;
      
      }catch(e){
      print("\n Fel: ${e.toString()}");
      return 0.0;
    }
  }

}
   
  

  
  
  