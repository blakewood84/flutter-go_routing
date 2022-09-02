import 'package:go_router/go_router.dart' show GoRouterHelper;

import 'package:flutter/material.dart';
import 'package:go_routing/extensions/single_where_or_null.dart';
import 'package:go_routing/provider/persons_provider.dart';
import 'package:provider/provider.dart';

import '../models/person.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    required this.query,
    Key? key,
  }) : super(key: key);
  final String? query;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool loading = true;
  late final Person? person;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      setState(() {
        loading = false;
      });
      person = context.read<PersonsProvider>().list.singleWhereOrNull((person) => person.name == widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (person == null)
              Text(
                'Person ${widget.query} not found!',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            if (person != null)
              ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: Text(person!.name),
                subtitle: Column(
                  children: [
                    Text(person!.age.toString()),
                    Text(person!.description),
                  ],
                ),
              ),
            const SizedBox(height: 20),
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
