class Person {
  String _namn;
  int _personnummer;

  // Constructor
  Person({required String namn, required int personnummer})
      : _namn = namn,
        _personnummer = personnummer;

  // Getters
  String get namn => _namn;
  int get personnummer => _personnummer;

  // Setters
  set namn(String namn) => _namn = namn;
  set personnummer(int personnummer) => _personnummer = personnummer;

  @override
  String toString() {
    return 'Person{namn: $_namn, personnummer: $_personnummer}';
  }
}
