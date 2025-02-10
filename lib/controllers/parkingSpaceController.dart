import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/repositories/parkingSpaceRepository.dart';

class ParkingspaceController {
  final ParkingSpaceRepository _parkingSpaceRepository;

  ParkingspaceController({required ParkingSpaceRepository parkingSpaceRepository}) 
  : _parkingSpaceRepository = parkingSpaceRepository;

  void createParkingSpace(String adress,){

  }
}