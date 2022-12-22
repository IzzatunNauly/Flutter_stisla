import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stislaflutter/models/category_models.dart';

class HttpHelper {
  final String _baseUrl = 'http://127.0.0.1:8000/api/';
  final String token = '';

  Future<Response> login(String email, String password, String deviceId) async {
    final url = Uri.parse(_baseUrl + 'auth/login');
    final body = {
      'email': email,
      'password': password,
      'device_name': deviceId
    };
    final headers = {
      'Accept': 'application/json',
    };

    final response = await post(url, body: body, headers: headers);
    var data = json.decode(response.body);
    _save('token', data['token']);
    _save('name', data['name']);
    _save('email', data['email']);

    return response;
  }

  Future<Response> register(
      String name, String email, String password, String deviceId) async {
    final url = Uri.parse(_baseUrl + 'auth/register');
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'device_name': deviceId,
    };
    final headers = {
      'Accept': 'application/json',
    };

    final response = await post(url, body: body, headers: headers);
    return response;
  }

  Future<Response> logout(String token) async {
    final url = Uri.parse(_baseUrl + 'auth/logout');
    final body = {};
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + '$token',
    };
    final response = await post(url, body: body, headers: headers);

    return response;
  }

  getKategori() async {
    final url = Uri.parse(_baseUrl + 'category');
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final token = prefs.get(key);
    final headers = {
      'Authorization': 'Bearer ' + '$token',
      'Accept': 'application/json',
    };
    final response = await get(url, headers: headers);
    return response;
  }

  _save(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    //const key = 'token';
    //final value = token;
    prefs.setString(key, data);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
