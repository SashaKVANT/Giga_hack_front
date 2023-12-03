import 'package:autogpt_frontend/agent_activation/data/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> makeStopApiRequest() async {
  final url = Uri.parse('http://127.0.0.1:8000/stop');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    print('Response:$response');
    if (response.statusCode == 200) {
      final responseData = response.body;
      // Обработка ответа, если необходимо
      print('API Response: $responseData');
    } else {
      // Обработка ошибки
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    // Обработка ошибки
    print('Error: $error');
  }
}
