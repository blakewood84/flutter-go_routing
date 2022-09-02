import 'package:go_router/go_router.dart' show GoRouterHelper;

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Id: ${widget.id}}'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Back to Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
