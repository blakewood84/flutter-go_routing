import 'package:flutter/foundation.dart' show immutable;

@immutable
class Person {
  final String name;
  final int age;
  final String description;

  const Person({
    required this.name,
    required this.age,
    required this.description,
  });
}
