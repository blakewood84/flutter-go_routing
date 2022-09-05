import 'package:flutter/material.dart';
import 'package:go_routing/models/person.dart';

class PersonsProvider extends ChangeNotifier {
  final list = <Person>[];

  void init() async {
    // for (final person in persons) {
    //   list.add(
    //     Person(
    //       age: person['age'] as int,
    //       name: person['name'] as String,
    //       description: person['description'] as String,
    //     ),
    //   );
    // }
    // notifyListeners();
  }

  Future<bool> addPerson(Person person) async {
    list.add(person);
    notifyListeners();
    return Future.value(true);
  }
}
