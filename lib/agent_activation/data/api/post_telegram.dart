import 'package:autogpt_frontend/agent_activation/data/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> makeApiRequest({
  required String sourceChannel,
  required String auditoryName,
}) async {
  final url = Uri.parse('http://127.0.0.1:8000/start');
  final Map<String, dynamic> requestData = {
    'source_channel': sourceChannel,
    'dest_channel': 't.me/news_gigachat',
    'auditory_name': auditoryName,
  };

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
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
