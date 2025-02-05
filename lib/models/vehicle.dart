import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicleType.dart';

abstract class Vehicle {
  late String _registreringsNummer;
  late Vehicletype _typ;
  late Person _owner;
 
 // constructor
  Vehicle({required String registreringsNummer, required  Vehicletype typ, required Person owner})
  :_registreringsNummer = registreringsNummer,
  _typ = typ,
  _owner = owner;

//Getters
String get registreringsNummer => _registreringsNummer;
Vehicletype get typ => _typ;
Person get owner => _owner;
//Setters
set registreringsNummer (String registreringsNummer)=>_registreringsNummer =registreringsNummer;
set typ(Vehicletype typ) => _typ = typ;
set owner (Person owner) => _owner = owner;

@override
  String toString() {
    return 'Vehicle{registreringsnummer: $registreringsNummer, typ: $typ, owner: ${owner.namn}}';
  }
  }
