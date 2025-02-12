import 'dart:convert';

import 'package:uppgift1/models/vehicle.dart';
class Person {
  String _namn;
  int _personNummer;
  int _id;

  // Constructor
 Person({
    required String namn,
    required int personNummer,
  })  : _namn = namn,
        _personNummer = personNummer,
        _id = 0;

  // Getters
  String get namn => _namn;
  int get personNummer => _personNummer;
  int get id => _id;

  // Setters
  set namn(String namn) => _namn = namn;
  set personNummer(int personNummer){
 if(personNummer.toString().length==12){
  _personNummer = personNummer;
 }else{
  throw Exception("Person number must be 12 digits");
 }
  } 

  set id(int id) {
    if (id > 0) {
      _id = id;
    } else {
      throw Exception("ID must be positive");
    }
  }
  @override
  String toString() {
    return 'Person(namn: $namn, personNummer: $personNummer, id: $id)';
  }
}