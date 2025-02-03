import 'dart:io';
import 'package:uppgift1/models/person.dart';

void main() {
  print('**** Välkommen till Parkeringsappen! ****');
  print('Vad vill du hantera? ');


  // Create a Person instance and print details
  var person = Person(namn: 'Justine', personnummer: 1122334);
  print(person);
}
