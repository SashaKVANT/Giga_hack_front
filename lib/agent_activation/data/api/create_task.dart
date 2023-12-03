import 'package:autogpt_frontend/agent_activation/data/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendTask(String input) async {
  final url = Uri.parse('http://127.0.0.1:8000/start');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'input': input}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData.toString();
    } else {
      // Обработка ошибки
      print('Error: ${response.statusCode}');
      return 'Error: ${response.statusCode}';
    }
  } catch (error) {
    // Обработка ошибки
    print('Error: $error');
    return 'Error: $error';
  }
}
