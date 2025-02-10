import 'package:uppgift1/models/parking.dart';
import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/parkingSpace.dart';

class ParkingSpaceRepository extends Repository<ParkingSpace,int> {
 final List<ParkingSpace>_parkingSpace=[];
     int _nextId=1;
   
     @override
     ParkingSpace add(ParkingSpace entity) {
     entity.id = _nextId ++;
     _parkingSpace.add(entity);
     return entity;
     }
   
     @override
     void deleteById(int id) {
       _parkingSpace.removeWhere((space)=> space.id == id);
     }
   
     @override
     List<ParkingSpace> findAll() {
       return _parkingSpace;
     }
   
     @override
     ParkingSpace findById(int id) {
      return _parkingSpace.firstWhere((space)=> space.id == id, orElse:() =>
      throw Exception("Parking Space med ID $id hittades inte"),);
     }
   
     @override
     void update(ParkingSpace entity) {
       int index = _parkingSpace.indexWhere((space)=>space.id == entity.id);
       if(index != -1){
        _parkingSpace[index] = entity;
       }
     }
   
  }