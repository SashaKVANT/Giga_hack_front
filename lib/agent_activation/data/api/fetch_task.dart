import 'package:autogpt_frontend/agent_activation/data/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchQueryFromTask(String taskId) async {
  final url = Uri.parse('http://localhost:8000/ap/v1/agent/tasks/$taskId');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final task = Task.fromJson(responseData);
      return task.input;
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
  return ''; // Возвращаем пустую строку в случае ошибки или отсутствия данных
}
