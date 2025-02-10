import 'package:uppgift1/controllers/repository.dart';
import 'package:uppgift1/models/vehicle.dart';

class VehicleController extends Repository<Vehicle,int> {
 final List<Vehicle> _vehicle =[];
 int _nextId =1;
  @override
  Vehicle add(Vehicle entity) {
    entity.id = _nextId ++;
    _vehicle.add(entity);
    return entity;
  }

  @override
  void deleteById(int id) {
    _vehicle.removeWhere((Vehicle)=>Vehicle.id == id);
  }

  @override
  List<Vehicle> findAll() {
    return _vehicle;
  }

  @override
  Vehicle findById(int id) {
    return _vehicle.firstWhere((vehicle)=> vehicle.id == id,orElse:()=>  throw Exception("Vehicle med ID $id hittades inte"),);
  }

  @override
  void update(Vehicle entity) {
    int index = _vehicle.indexWhere((vehicle)=>vehicle.id == entity.id);
    if(index != -1){
      _vehicle[index]= entity;
    }else{
      throw Exception("Vehicle med ID ${entity.id} hittades inte.")
    }

     int getNextId(){
    return _nextId;
  }
  }
}