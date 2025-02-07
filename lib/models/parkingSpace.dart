class ParkingSpace {
  late int _id;
  late String _adress;
  late double _pricePerHour;
  
//constructor
ParkingSpace({required int id, 
required  String adress, 
required double pricePerHour,

}) : _id = id,
_adress = adress,
_pricePerHour = pricePerHour;

//Getters
int get id => _id;
String get adress => _adress;
double get pricePerHour => _pricePerHour;

//Setters
set id (int id)=> _id =id;
set adress(String adress)=>_adress= adress;
set pricePerHour( double pricePerHour)=> _pricePerHour = pricePerHour;

@override
String toString(){
  return'ParkingSpace{id: $_id}, adress: $_adress, pricePerHour: $_pricePerHour}';
}

}