import 'package:go_routing/extensions/get_url_response.dart';
import 'package:meta/meta.dart' show immutable, useResult;
import 'dart:convert';

mixin CanMakeGetCall {
  String get url;

  @useResult
  Future<String> getString() => getUrl(url).then(
        (resp) => resp.transform(utf8.decoder).join(),
      );
}

@immutable
class ApiClient with CanMakeGetCall {
  const ApiClient({required this.url});

  @override
  final String url;
}
