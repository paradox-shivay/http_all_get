import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RestApiGet {
  String url = "https://reqres.in/api/users?page=2";

  _buildHeader() {
    return {
      'Accept': 'application/json',
    };
  }

  Future<Map<String, dynamic>> getData() async {
    http.Response response = await http.get(url, headers: _buildHeader());
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

}