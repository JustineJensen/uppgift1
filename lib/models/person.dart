import 'dart:convert';
class Person {
  String _namn;
  int _personNummer;
  int _id;

  // Constructor
 Person({
    required String namn,
    required int personNummer,
    required int id,
  })  : _namn = namn,
        _personNummer = personNummer,
        _id = id;

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
  String toString() => 'Person(_namn: $_namn, _personNummer: $_personNummer, _id: $_id)';
  
}