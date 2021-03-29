import 'package:bytebank/services/interceptors/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

const baseUrl = 'http://192.168.100.20:3333';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [HttpInterceptor()],
  requestTimeout: Duration(seconds: 5),
);

void throwHttpError(int statusCode) =>
    throw Exception(_statusCodeResponses[statusCode]);

final Map<int, String> _statusCodeResponses = {
  400: 'there was an error submitting transaction',
  401: 'authentication failed'
};

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}

String getResponseMessage(int statusCode) {
  if (_statusCodeResponses.containsKey(statusCode)) {
    return _statusCodeResponses[statusCode];
  }
  return 'unknown error';
}
