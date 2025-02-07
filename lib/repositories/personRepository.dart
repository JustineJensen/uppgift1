import 'package:uppgift1/models/person.dart';

class PersonRepository {
  static final PersonRepository _instance = PersonRepository._internal();
  final List <Person>_person =[];

  PersonRepository._internal();

// The same instance will be returned when ever the PersonRepository is called
  factory PersonRepository(){
    return _instance;
  }
  //Add a person 
  void add(Person person){
    if(!person.isValid()){
      throw Exception("Invalid Person data");
    }
    _person.add(person);
  }
  //Get all person
List<Person> getAll(){
  return List.unmodifiable(_person);
}
Person? getById(String id) {
  try{
    return _person.firstWhere((p)=> p.id == id);
  }catch(e){
    return null;
  }
    
}


}