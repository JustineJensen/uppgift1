import 'dart:io';

import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicle.dart';
import 'package:uppgift1/repositories/personRepository.dart';

void main() {
 final PersonRepository personRepository = PersonRepository();
  while(true){
     print('**** Välkommen till Parkeringsappen! ****');
     print('Vad vill du hantera? ');
     print("1. Personer");
     print("2. Fordon");
     print("3. Parkeringsplatser");
     print("4. Parkeringar");
     print("5. Avsluta");
     stdout.write("Välj ett alternativ (1-5): ");

    String? choice = stdin.readLineSync();
     switch(choice){
      case "1":
      handlePerson();
      break;

      case "2":
      handleVehicles();
      break;

      case "3":
      print("\nParkeringpaltser hantering kommer snart...");
      break;

      case"4":
      print("\n Parkeringarshantering visas snart....");
      break;
      
      case "5":
      print("\n Avslutar programmet");
      exit(0);
      default:
      print("\nOgiltigt regitreringsnummer, försök igen! ");
     }
  }

}

void handlePerson() {
  while(true){
    print("\n Du har valt att hantera Personer. Vad vill du göra");
    print("1.Skapa ny person");
    print("2. Visa alla personer");
    print("3. Uppdatera person");
    print("4. Gå tillbaka till Menyn");
    stdout.write("Välj ett alternativ (1-5): ");
    
    String? choice = stdin.readLineSync();
    switch(choice){
      case"1":
      createPerson();
      break;
      
    }
  }
}

void createPerson() {
}

void handleVehicles() {
}
