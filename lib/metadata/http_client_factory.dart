import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

http.Client createHttpClient() {
  final httpClient = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);
  return IOClient(httpClient);
}
