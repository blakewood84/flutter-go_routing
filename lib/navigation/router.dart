import 'package:go_router/go_router.dart';

import 'package:go_routing/main.dart';
import 'package:go_routing/screens/forms/person_form.dart';
import 'package:go_routing/screens/home.dart';
import 'package:go_routing/screens/page2.dart';
import 'package:go_routing/screens/search.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
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
      path: '/person',
      builder: (context, state) => const Page2(),
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
