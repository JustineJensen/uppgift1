import 'package:uppgift1/models/person.dart';
import 'package:uppgift1/repositories/personRepository.dart';
class PersonController {
final PersonRepository personRepository;

  PersonController({required this.personRepository});
  
  void createPerson(String name, int personNummer){
    if(name.isEmpty || personNummer.toString().length !=12){
      throw Exception("Fel Personnummer eller Name! Försök igen");
    }
    Person newPerson = Person(
      namn: name,
      personNummer: personNummer,
      id: personRepository.getNextId(),
    );
    personRepository.add(newPerson);
    print(("\nPerson tillagd: ${newPerson.namn} med ID: ${newPerson.id}"));

  }
   List<Person> showAllPersons(){
    return personRepository.findAll();
   }
   void updatePerson(int id, String newName, int personNumber){
    Person? person = personRepository.findById(id);
    if(person==null){
      throw Exception("\nPerson hittades inte");
    }
    person.namn = newName;
    person.personNummer;
    personRepository.update(person);
    print ("\n Person uppdaterade!");
   }
   void deletePerson(int id){
    personRepository.deleteById(id);
    print ("\n Person borttagen");
   }
  
  void findPersonById(int id){
    try{
      Person person = personRepository.findById(id);
      print("\n Person hittade: $person");
    }catch(e){
      print("\n Fel:${e.toString()}");
    }
  }

}
