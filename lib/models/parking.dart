import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/models/vehicle.dart';

class Parking {
  late Vehicle  _fordon;
  late ParkingSpace _parkingSpace;
  late DateTime _startTime;
  DateTime? _endTime;

  Parking ({
  required Vehicle fordon,
  required ParkingSpace parkingSpace,
  required DateTime startTime,
  DateTime? endTime,
  
  }) : _fordon = fordon,
  _parkingSpace = parkingSpace,
  _startTime= startTime,
  _endTime = endTime;

// Getters
Vehicle get vehicle => _fordon;
ParkingSpace get parkingSpace =>_parkingSpace;
DateTime get startTime => _startTime;
DateTime? get endTime => _endTime;

//setters 
set Vehicle(Vehicle fordon) => _fordon = fordon;
set ParkingSpace (ParkingSpace parkingSpace)=> _parkingSpace = parkingSpace;
set startTime(DateTime startTime)=> _startTime = startTime;
set endToime (DateTime? endTime)=> _endTime = endTime;

@override
String toString(){
  return'Parking{vehicle: ${_fordon.registeringsnummer},parkingSpace: ${_parkingSpace.id},startTime: $_startTime, endTime:$_endTime}';
}

  
}