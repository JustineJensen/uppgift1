import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/models/vehicle.dart';

class Parking {
  late int _id;
  late Vehicle  _fordon;
  late ParkingSpace _parkingSpace;
  late DateTime _startTime;
  DateTime? _endTime;

  Parking ({
  required int id,
  required Vehicle fordon,
  required ParkingSpace parkingSpace,
  required DateTime startTime,
  DateTime? endTime,
  
  }) : _id= id,
  _fordon = fordon,
  _parkingSpace = parkingSpace,
  _startTime= startTime,
  _endTime = endTime;

  // Getters
  int get id => id;
  Vehicle get vehicle => _fordon;
  ParkingSpace get parkingSpace =>_parkingSpace;
  DateTime get startTime => _startTime;
  DateTime? get endTime => _endTime;

  //setters
  set id(int id)=> _id = id;
  set Vehicle(Vehicle fordon) => _fordon = fordon;
  set ParkingSpace (ParkingSpace parkingSpace)=> _parkingSpace = parkingSpace;
  set startTime(DateTime startTime)=> _startTime = startTime;
  set endToime (DateTime? endTime)=> _endTime = endTime;

  @override
  String toString(){
    return 'Parking{id: $_id, vehicle: ${_fordon.registeringsnummer}, parkingSpace: ${_parkingSpace.id}, startTime: $_startTime, endTime: $_endTime}';
    }
} 
