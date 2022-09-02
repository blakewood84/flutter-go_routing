import 'package:flutter/material.dart';
import 'package:go_routing/models/person.dart';

class PersonsProvider extends ChangeNotifier {
  final list = <Person>[];
}
