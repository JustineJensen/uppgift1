import 'dart:io';

import 'package:uppgift1/controllers/parkingController.dart';
import 'package:uppgift1/controllers/parkingSpaceController.dart';
import 'package:uppgift1/controllers/vehicleController.dart';
import 'package:uppgift1/models/car.dart';
import 'package:uppgift1/models/parkingSpace.dart';
import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/models/vehicle.dart';
import 'package:uppgift1/models/vehicleType.dart';
import 'package:uppgift1/repositories/parkingRepository.dart';
import 'package:uppgift1/repositories/parkingSpaceRepository.dart';
import 'package:uppgift1/repositories/personRepository.dart';
import 'package:uppgift1/controllers/personController.dart';
import 'package:uppgift1/repositories/vehicleRepository.dart';

  final PersonRepository personRepository = PersonRepository();
  final PersonController  personController = PersonController(personRepository: personRepository);
  final ParkingRepository parkingRepository = ParkingRepository();
  final ParkingController parkingController = ParkingController(parkingRepository);
  final ParkingSpaceRepository parkingSpaceRepository = ParkingSpaceRepository();
  final ParkingSpaceController parkingspaceController = ParkingSpaceController(parkingSpaceRepository: parkingSpaceRepository);
  final VehicleController vehicleController = VehicleController(vehicleRepository: vehicleRepository);
  final VehicleRepository vehicleRepository =VehicleRepository();
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
      handleParkingPlaces();
      break;
      case "4":
      handleParking();
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
  while (true) {
    print("\n Du har valt att hantera Personer. Vad vill du göra");
    print("1. Skapa ny person");
    print("2. Visa alla personer");
    print("3. Uppdatera person");
    print("4. Ta bort person");
    print("5. Tillbaka till huvudmenyn"); 
    stdout.write("Välj ett alternativ (1-5): ");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        stdout.write("\n Ange namn:");
        String? namn = stdin.readLineSync();
        stdout.write("\n Ange Personnummer (12 siffror):");
        String? personnummerStr = stdin.readLineSync();
        if (personnummerStr == null || personnummerStr.length != 12 || int.tryParse(personnummerStr) == null) {
          print("\n Fel: Ange ett giltigt personnummer (12 siffror)!");
          continue;
        }
        int personNummer = int.parse(personnummerStr);
        try {
          personController.createPerson(namn!, personNummer);
        } catch (e) {
          print("\n Fel: ${e.toString()}");
        }
        break;
      case "2":
        final persons = personController.showAllPersons();
        if (persons.isEmpty) {
          print("\n Inga Personer hittades");
        } else {
          persons.forEach((p) => print("ID:${p.id}, Namn: ${p.namn}, PersonNummer: ${p.personNummer}"));
        }
        break;
      case "3":
        stdout.write("\n Ange personens ID som du vill uppdatera: ");
        int id = int.parse(stdin.readLineSync()!);

        stdout.write("Ange namn: ");
        String newName = stdin.readLineSync()!;

        stdout.write("Ange Personnummer: ");
        int personNumber = int.parse(stdin.readLineSync()!);

        try {
          personController.updatePerson(id, newName, personNumber);
        } catch (e) {
          print("\n Fel: ${e.toString()}");
        }
        break;
      case "4":
        stdout.write("\n Ange ID på personen du vill ta bort: ");
        int id = int.parse(stdin.readLineSync()!);
        personController.deletePerson(id);
        break;
      case "5":
        print("\nTillbaka till huvudmenyn...");  
        return; 
      default:
        print("\n Ogiltigt val, försök igen.");
    }
  }
}

void handleParkingPlaces(){
  while (true) {
    print("\nDu har valt att hantera Parkeringsplatser. Vad vill du göra?");
    print("1. Skapa ny parkeringsplats");
    print("2. Visa alla parkeringsplatser");
    print("3. Uppdatera parkeringsplats");
    print("4. Ta bort parkeringsplats");
    print("5. Tillbaka till huvudmenyn");
    stdout.write("Välj ett alternativ (1-5): ");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        stdout.write("\nAnge parkeringsplatsens ID: ");
        int? id = int.tryParse(stdin.readLineSync() ?? "");
        stdout.write("\nAnge Områdeskod eller parkeringsadress: ");
        String? adress = stdin.readLineSync();
        stdout.write("\nAnge pris per timme för parkering: ");
        double? pricePerHour = double.tryParse(stdin.readLineSync() ?? "");

        if (id == null || adress == null || adress.isEmpty || pricePerHour == null) {
          print("\nFel: Ange giltiga värden för ID, adress och pris per timme!");
          break;
        }

        ParkingSpace newSpace = ParkingSpace(id: id, adress: adress, pricePerHour: pricePerHour);
        parkingSpaceRepository.add(newSpace);
        print("\nParkeringsplats skapad framgångsrikt!");
        break;

      case "2":
        final spaces = parkingSpaceRepository.findAll();
        if (spaces.isEmpty) {
          print("\nInga parkeringsplatser hittades.");
        } else {
          spaces.forEach((p) => print("ID: ${p.id}, Adress: ${p.adress}, Pris per timme: ${p.pricePerHour} SEK"));
        }
        break;

      case "3":
        stdout.write("\nAnge ID för parkeringsplatsen att uppdatera: ");
        int? idToUpdate = int.tryParse(stdin.readLineSync() ?? "");

        if (idToUpdate == null) {
          print("\nFel: Ange ett giltigt ID!");
          break;
        }

        try {
              ParkingSpace existingSpace = parkingSpaceRepository.findById(idToUpdate);

              stdout.write("\nAnge ny adress (lämna tomt för att behålla befintlig): ");
              String? newAdress = stdin.readLineSync();
              stdout.write("\nAnge nytt pris per timme (lämna tomt för att behålla befintligt): ");
              String? newPriceInput = stdin.readLineSync();
              double? newPricePerHour = newPriceInput!.isNotEmpty ? double.tryParse(newPriceInput) : existingSpace.pricePerHour;
            
              ParkingSpace updatedSpace = ParkingSpace(
                id: existingSpace.id,
                adress: newAdress!.isNotEmpty ? newAdress : existingSpace.adress,
                pricePerHour: newPricePerHour!,
            );
            // Uppdatera parkeringsplatsen i repository
              parkingSpaceRepository.update(updatedSpace);

              print("\nParkeringsplats uppdaterad!");
            } catch (e) {
                print("\nFel vid uppdatering: ${e.toString()}");
         }
        break;
      case "4":
        stdout.write("\nAnge ID för parkeringsplatsen att ta bort: ");
        int? idToDelete = int.tryParse(stdin.readLineSync() ?? "");

        if (idToDelete == null) {
          print("\nFel: Ange ett giltigt ID!");
          break;
        }
        parkingSpaceRepository.deleteById(idToDelete);
        print("\nParkeringsplats borttagen!");
        break;

      case "5":
        print("\nTillbaka till huvudmenyn...");
        return;

      default:
        print("\nOgiltigt val, försök igen.");
    }
  }
}

void handleVehicles() {
  while (true) {
    print("\n Du har valt att hantera Fordon. Vad vill du göra?");
    print("1. Registrera nytt fordon");
    print("2. Visa alla fordon");
    print("3. Ta bort fordon");
    print("4. Tillbaka till huvudmenyn");
    stdout.write("Välj ett alternativ (1-4): ");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        stdout.write("\nAnge registreringsnummer: ");
        String? regNum = stdin.readLineSync();

        stdout.write("\nAnge person-ID för fordonsägaren: ");
        int? ownerId = int.tryParse(stdin.readLineSync() ?? "");

        stdout.write("\nAnge fordonstyp (1 = Bil, 2 = Motorcykel,3 LastBil): ");
        int? typeChoice = int.tryParse(stdin.readLineSync() ?? "");
        VehicleType? vehicleType;

        if (typeChoice == 1) {
          vehicleType = VehicleType.Car;
        } else if (typeChoice == 2) {
          vehicleType = VehicleType.Motorcycle;
        } else if (typeChoice == 3){
          vehicleType = VehicleType.Lastbil;
        }else{
          print("\nFel: Ogiltig fordonstyp!");
          break;
        }
        stdout.write("\nAnge bilens färg: ");
        String? color = stdin.readLineSync();

        if (regNum == null || regNum.isEmpty || ownerId == null || color == null || color.isEmpty) {
          print("\nFel: Alla fält måste fyllas i!");
          break;
        }
        try {
          Person owner = personController.personRepository.findById(ownerId);
           if (owner == null) {
              print("\n Fel: Ägaren med ID $ownerId hittades inte!");
              break;
            }
          Vehicle newVehicle = vehicleController.createVehicle(regNum,vehicleType,owner,color);         
          print("\n Fordon registrerat framgångsrikt!");
        } catch (e) {
          print("\nFel: ${e.toString()}");
        }
      break;

      case "2":
        final vehicles = vehicleController.getAllVehicles();
        vehicles.forEach((v) {
          if (v is Car) {
            print("Reg.nr: ${v.registreringsNummer}, Ägare: ${v.owner.namn}, Typ: ${v.typ.name}, Färg: ${v.color}");
          } else {
            print("Reg.nr: ${v.registreringsNummer}, Ägare: ${v.owner.namn}, Typ: ${v.typ.name}");
          }
        });
        break;

      case "3":
        stdout.write("\nAnge registreringsnummer för fordonet att ta bort: ");
        String? regNumToDelete = stdin.readLineSync();

        if (regNumToDelete == null || regNumToDelete.isEmpty) {
          print("\nFel: Ange ett giltigt registreringsnummer!");
          break;
        }
        vehicleController.deleteVehicle(regNumToDelete);
        print("\nFordon borttaget!");
        break;
      case "4":
        print("\nTillbaka till huvudmenyn...");
        return;
      default:
        print("\nOgiltigt val, försök igen.");
    }
  }
}

 void handleParking(){
 while (true) {
    print("\nDu har valt att hantera Parkeringar. Vad vill du göra?");
    print("1. Skapa ny parkering");
    print("2. Visa alla parkeringar");
    print("3. Ta bort parkering");
    print("4. Beräkna kostnad för parkeringen");
    print("5. Tillbaka till huvudmenyn");
    stdout.write("Välj ett alternativ (1-4): ");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        stdout.write("\nAnge parkeringsplatsens ID: ");
        int? parkingSpaceId = int.tryParse(stdin.readLineSync() ?? "");
        stdout.write("\nAnge registreringsnummer för fordonet: ");
        String? regNum = stdin.readLineSync();
        stdout.write("\nAnge starttid (YYYY-MM-DD HH:MM): ");
        String? startTime = stdin.readLineSync();

        if (parkingSpaceId == null || regNum == null || regNum.isEmpty || startTime == null || startTime.isEmpty) {
          print("\nFel: Alla fält måste fyllas i!");
          break;
        }

        try {
          Vehicle vehicle = vehicleController.getVehicleByRegNum(regNum);
          ParkingSpace parkingSpace = parkingSpaceRepository.findById(parkingSpaceId);

          parkingController.createParking(
            vehicle,
            parkingSpace,
            DateTime.parse(startTime) 
          );
          print("\nParkering skapad framgångsrikt!");
        } catch (e) {
          print("\nFel: ${e.toString()}");
        }
        break;

      case "2":
        final parkings = parkingController.listAllParking();
        if (parkings.isEmpty) {
          print("\nInga parkeringar hittades.");
        } else {
          parkings.forEach((p) => print(
              "ID: ${p.id}, Fordon: ${p.vehicle.registreringsNummer}, Parkeringsplats: ${p.parkingSpace.id}, Starttid: ${p.startTime}"));
        }
        break;

      case "3":
        stdout.write("\nAnge ID för parkeringen att ta bort: ");
        int? parkingId = int.tryParse(stdin.readLineSync() ?? "");

        if (parkingId == null) {
          print("\nFel: Ange ett giltigt parkerings-ID!");
          break;
        }

        try {
          parkingController.deleteParking(parkingId);
          print("\nParkering borttagen!");
        } catch (e) {
          print("\nFel: ${e.toString()}");
        }
        break;
      
      case "4":
        stdout.write("\nAnge ID för parkeringen du vill beräkna kostnaden för: ");
        int? parkingId = int.tryParse(stdin.readLineSync() ?? "");

        if (parkingId == null) {
          print("\n Fel: Ange ett giltigt parkerings-ID!");
          break;
        }
          stdout.write("\nAnge sluttid (YYYY-MM-DD HH:MM): ");
          String? endTime = stdin.readLineSync();

          if (endTime == null || endTime.isEmpty) {
            print("\n Fel: Sluttid måste anges!");
            break;
          }

        try {
          parkingController.endParking(parkingId, endTime);
          double cost = parkingController.calculateParkingCost(parkingId, endTime);
            print("\nParkeringskostnad: ${cost.toStringAsFixed(2)} SEK");
          } catch (e) {
            print("\nFel: ${e.toString()}");
        }
        break;
        
      case "5":
        print("\nTillbaka till huvudmenyn...");
        return;

      default:
        print("\nOgiltigt val, försök igen.");
    }
  }
}

 void handleCalculateParkingCost() {
  stdout.write("\nAnge parkerings-ID: ");
  int? parkingId = int.tryParse(stdin.readLineSync() ?? "");

  if (parkingId == null) {
    print("\nFel: Ange ett giltigt parkerings-ID!");
    return;
  }
  stdout.write("\nAnge sluttid (YYYY-MM-DD HH:MM): ");
  String? endTime = stdin.readLineSync();

  if (endTime == null || endTime.isEmpty) {
    print("\nFel: Sluttid måste anges!");
    return;
  }

  try {
    double cost = parkingController.calculateParkingCost(parkingId, endTime);
    if (cost > 0) {
      print("\nTotal parkeringskostnad: ${cost.toStringAsFixed(2)} SEK");
    } else {
      print("\nFel: Parkeringen kan inte beräknas.");
    }
  } catch (e) {
    print("\nFel: ${e.toString()}");
  }
}

