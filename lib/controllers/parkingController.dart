import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/parking.dart';

class Parkingcontroller extends Repository<Parking,int> {
  final List<Parking> _parking =[];

  @override
 Parking add( Parking parking) {
   _parking.add(parking);
   return parking;
 }

  @override
  void deleteById(int id) {
    _parking.removeWhere(
        (parking) => parking.parkingSpace.id == id);
  }

  @override
  List<Parking> findAll() {
    return _parking;
  
  }

  @override
  Parking findById(int id) {
    return _parking.firstWhere((parking)=>parking.id ==id, orElse:()=>
    throw Exception("Parking med ID $id hittades inte"),);
   
  }

  @override
  void update(entity) {
    // TODO: implement update
  }
}