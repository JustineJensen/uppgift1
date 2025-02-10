import 'package:uppgift1/models/parking.dart';
import 'package:uppgift1/controllers/repository.dart';

class Parkingrepository extends Repository<Parking,int> {
  final List<Parking> _parking =[];
 
  @override
  void add( Parking parking) {
    _parking.add(parking);
  }

  @override
  void deleteById(id) {
    // TODO: implement deleteById
  }

  @override
  List findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  findById(id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  void update(entity) {
    // TODO: implement update
  }
}
