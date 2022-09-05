import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_routing/data/api_client.dart';
import 'package:go_routing/models/person.dart';

class PersonsProvider extends ChangeNotifier {
  final list = <Person>[];

  final apiClient = const ApiClient(url: 'http://localhost:5500/json/persons.json');

  void init() async {
    final response = await apiClient.getDataDecoded();
    for (final person in response) {
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
