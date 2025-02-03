import 'dart:io';
import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicle.dart';

void main() {
  print('**** Välkommen till Parkeringsappen! ****');
  print('Vad vill du hantera? ');
  // this creates a person instans
  // Testing person class
  var person = Person(namn: 'Justine', personnummer: 1122334);
  print(person);

  var vehicle = Vehicle(registreringsnummer: '123wdb', typ: 'car', owner: Person(namn: 'Justine', personnummer: 123456));
  print(vehicle);
}
