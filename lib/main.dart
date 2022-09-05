import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routing/extensions/single_where_or_null.dart';
import 'package:go_routing/provider/persons_provider.dart';
import 'package:go_routing/screens/forms/person_form.dart';
import 'package:go_routing/screens/home.dart';
import 'package:go_routing/screens/person_details.dart';
import 'package:go_routing/screens/search.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          final name = state.extra;
          print('NAME: $name');
          return const MyHomePage();
        },
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          final query = state.queryParams['query'];
          return SearchPage(query: query);
        },
      ),
      GoRoute(
        name: 'person',
        path: '/person/:name',
        builder: (context, state) {
          final name = state.params['name'];
          final person = context.read<PersonsProvider>().list.singleWhereOrNull((person) => person.name == name);
          return PersonDetails(person: person);
        },
        routes: [
          GoRoute(
            path: 'person_form/:id',
            builder: (context, state) {
              final id = state.params['id'];
              return PersonForm(
                id: id,
              );
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PersonsProvider())],
      child: MaterialApp.router(
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        title: 'Go Router Example',
      ),
    );
  }
}
