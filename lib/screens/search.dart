import 'package:go_router/go_router.dart' show GoRouterHelper;

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    required this.query,
    Key? key,
  }) : super(key: key);
  final String? query;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Query: $query',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
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
