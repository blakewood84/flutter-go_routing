import 'package:flutter/material.dart';
import 'package:go_routing/models/person.dart';

const persons = [
  {
    'name': 'Tom',
    'age': 22,
    'description': 'A good person.',
  },
  {
    'name': 'John',
    'age': 30,
    'description': 'An apostle.',
  },
  {
    'name': 'Mark',
    'age': 24,
    'description': 'A prophet.',
  },
];

class PersonsProvider extends ChangeNotifier {
  final list = <Person>[];

  void init() {
    for (final person in persons) {
      list.add(
        Person(
          age: person['age'] as int,
          name: person['name'] as String,
          description: person['description'] as String,
        ),
      );
    }
    notifyListeners();
  }

  Future<bool> addPerson(Person person) async {
    list.add(person);
    notifyListeners();
    return Future.value(true);
  }
}
