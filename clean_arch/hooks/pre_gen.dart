import 'dart:convert';
import 'dart:io';
import 'package:change_case/change_case.dart';
import 'package:mason/mason.dart';

import 'variables_model.dart';

void run(HookContext context) {
  _prepareJsonProperties(context);
  _prepareOperations(context);
  _prepareStateManagement(context);
}

void _prepareStateManagement(HookContext context) {
  final stateManagement =
      context.vars['state_management'].toString().toLowerCase();
  final isBloc = stateManagement == 'bloc';
  final isProvider = stateManagement == 'provider';

  context.vars['isBloc'] = isBloc;
  context.vars['isProvider'] = isProvider;
}

void _prepareOperations(HookContext context) {
  final vars = VariablesModel.fromJson(context.vars);
  context.logger.info('vars parsed successfully');

  // Retrieve the 'operations' list from Mason variables
  final List operations = vars.operations;

  if (operations.isEmpty) {
    context.logger.info('No operations found.');
    return;
  }

  final Directory dir =
      Directory('domain/use_cases/${vars.feature.toSnakeCase()}');

  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
    context.logger.info('Created directory: ${dir.path}');
  }

  for (final operation in operations) {
    final String fileName =
        '${operation.toString().toSnakeCase()}_${vars.feature.toSnakeCase()}_use_case.dart';
    final File file = File('${dir.path}/$fileName');

    // Writing content to the file
    file.writeAsStringSync('''
import 'package:dartz/dartz.dart'; 
import '../../../index.dart';
${vars.createBases ? "import '../../../../core/${vars.useCase.toSnakeCase()}.dart';" : ''}
${vars.createBases ? "import '../../../../core/${vars.failure.toSnakeCase()}.dart';" : ''}

class ${operation.toString().toPascalCase()}${vars.feature.toPascalCase()}UseCase 
implements ${vars.useCase.toPascalCase()}<${vars.feature.toPascalCase()}Entity, NoParams> {

  const ${operation.toString().toPascalCase()}${vars.feature.toPascalCase()}UseCase(this.repo);

  final ${vars.feature.toPascalCase()}Repo repo;
  
  @override
  Future<Either<${vars.failure.toPascalCase()}, ${vars.feature.toPascalCase()}Entity>> call(NoParams params){
    return repo.${operation.toString().toCamelCase()}${vars.feature.toPascalCase()}();
  }
}
''');

    context.logger.info('Generated file: ${file.path}');
  }
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
