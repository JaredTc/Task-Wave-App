import 'package:http/http.dart' as http;
import 'package:taskwave/config/api/api_const.dart';
import 'package:taskwave/config/api/end_points.dart';
import 'package:taskwave/models/tasks_model.dart';
import 'dart:convert';

class TaskService {
  final String baseUrl = ApiConst.taskPath;
  final String taskList = EndPoints.TASK_LIST;

  Future<List<Tasks>> fetchTasks() async {
    
    final url = Uri.parse('$baseUrl/$taskList');

    print('Request URL: $url');
    
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List) {
          return jsonData.map((task) => Tasks.fromJson(task)).toList();
        } else {
          throw Exception('Unexpected JSON format');
        }
      } else {
        throw Exception('Failed to fetch task data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to fetch task data: $e');
    }
  }
}