import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicleType.dart';

abstract class Vehicle {
  late String _registreringsnummer;
  late Vehicletype _typ;
  late Person _owner;
 
 // constructor
  Vehicle({required String registreringsnummer, required  Vehicletype typ, required Person owner})
  :_registreringsnummer = registreringsnummer,
  _typ = typ,
  _owner = owner;

//Getters
String get registreringsnummer => _registreringsnummer;
Vehicletype get typ => _typ;
Person get owner => _owner;
//Setters
set registreringsnummer (String registreringsnummer)=>_registreringsnummer =registreringsnummer;
set typ(Vehicletype typ) => _typ = typ;
set owner (Person owner) => _owner = owner;

@override
 void showVehicleInfo(){
  print('This is a motorcycle');

 }
  }
