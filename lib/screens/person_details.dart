import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routing/models/person.dart';

class PersonDetails extends StatefulWidget {
  const PersonDetails({
    required this.person,
    Key? key,
  }) : super(key: key);

  final Person? person;

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (widget.person == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
            'Person Not Found!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: size.height * .2),
            Text(
              'Name: ${widget.person!.name}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Age: ${widget.person!.age.toString()}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Description: ${widget.person!.description}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
