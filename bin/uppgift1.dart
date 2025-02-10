import 'dart:io';

import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicle.dart';
import 'package:uppgift1/repositories/personRepository.dart';
import 'package:uppgift1/controllers/personController.dart';

 final PersonRepository personRepository = PersonRepository();
  final PersonController  personController = PersonController(personRepository: personRepository);
void main() {
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
     stdout.write("\n Ange namn:");
     String? namn= stdin.readLineSync();
     stdout.write("\n Ange Personnummer(12 siffor):");
     String? personnummerStr = stdin.readLineSync();
     if (personnummerStr == null || personnummerStr.length != 12 || int.tryParse(personnummerStr) == null) {
         print("\n Fel: Ange ett giltigt personnummer (12 siffror)!");
          return;
      }
      int personNummer = int.parse(personnummerStr);
     try{
      personController.createPerson(namn!, personNummer);
     }catch(e){
      print("\n Fel: ${e.toString()}");
     }
      break;
      case "2":
      final persons = personController.showAllPersons();
      if(persons.isEmpty){
        print("\n Inga Personer hittades");
      }else{
        persons.forEach((p)=> print("ID:${p.id},Namn: ${p.namn},PersonNummer: ${p.personNummer}"));
      }
      break;
      case"3":
      stdout.write("\n Ange persones ID som du vill uppdatera");
      int id = int.parse(stdin.readLineSync()!);
      
      stdout.write("Ange namn");
      String newName = stdin.readLineSync()!;

      stdout.write("Ange Personnnummer");
      int personNumber = int.parse(stdin.readLineSync()!);

      try{
        personController.updatePerson(id, newName,personNumber);
    }catch(e){
      print("\n Fel: ${e.toString()}");
    }
    break;
    case"4":
    stdout.write("\n Anger ID på personen du vill ta bort");
    int id = int.parse(stdin.readLineSync()!);
    personController.deletePerson(id);
    break;
    case"5":
    default:
    print("\n Ogiltigt val, försök igen");
    }
  }
}
void handleVehicles() {
  while(true){
    print("object");
  }
}

