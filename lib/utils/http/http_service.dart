import 'dart:async';
import 'package:fast_credit/utils/http/response_handler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// This manages all HTTP functions that will be used throughout the app
class HttpService {
  final String _baseUrl;

  HttpService(this._baseUrl);
  String get baseUrl => _baseUrl;

  Future<dynamic> get(String path) async {
    final String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    final response = await http
        .get(uri, headers: await getHeaders())
        .timeout(const Duration(seconds: 40));
    return handleResponse(response);
  }

  getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object accessToken = prefs.get('token');
    return <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': 'Bearer $accessToken',
      'Charset': 'utf-8',
    };
  }
}
