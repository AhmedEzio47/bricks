import 'dart:convert';
import 'package:mason/mason.dart';

void run(HookContext context) {
  _prepareJsonProperties(context);
}

void _prepareJsonProperties(HookContext context) {
  final jsonData = context.vars['json_data'];
  Map<String, dynamic> jsonMap;
  try {
    if (jsonData is String) {
      jsonMap = jsonDecode(jsonData);
    } else {
      jsonMap = jsonData;
    }

    final properties = jsonMap.entries.map((entry) {
      return {
        'name': entry.key,
        'type': _determineType(entry.value),
      };
    }).toList();

    context.vars['properties'] = properties;
  } catch (e) {
    throw Exception('Invalid JSON format: $e');
  }
}

String _determineType(dynamic value) {
  if (value is num) return 'num';
  if (value is bool) return 'bool';
  if (value is List) return 'List<dynamic>';
  return 'String';
}
