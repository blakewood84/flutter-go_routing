// ignore_for_file: use_build_context_synchronously

import 'package:go_router/go_router.dart' show GoRouterHelper;

import 'package:flutter/material.dart';
import 'package:go_routing/models/person.dart';
import 'package:go_routing/provider/persons_provider.dart';
import 'package:go_routing/widgets/form_input.dart';
import 'package:provider/provider.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({
    required this.id,
    Key? key,
  }) : super(key: key);

  final String? id;

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final _formState = {'name': '', 'age': '', 'description': ''};
  final _key = GlobalKey<FormState>();

  void _handleSubmit() async {
    if (_key.currentState!.validate()) {
      final name = _formState['name'] as String;
      final age = int.parse(_formState['age'] as String);
      final description = _formState['description'] as String;
      final person = Person(name: name, age: age, description: description);

      await context.read<PersonsProvider>().addPerson(person);
      context.go('/', extra: person.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Id: ${widget.id}'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Form(
        key: _key,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: size.height * .1),
              const Text(
                'Add Person Form',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              FormInput(
                labelText: 'Name',
                onChanged: (value) {
                  _formState['name'] = value!;
                },
              ),
              const SizedBox(height: 20),
              FormInput(
                labelText: 'Age',
                onChanged: (value) {
                  _formState['age'] = value!;
                },
              ),
              const SizedBox(height: 20),
              FormInput(
                labelText: 'Description',
                onChanged: (value) {
                  _formState['description'] = value!;
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    child: const Text('Submit'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
