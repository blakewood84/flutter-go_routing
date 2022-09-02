import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Page 2',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
