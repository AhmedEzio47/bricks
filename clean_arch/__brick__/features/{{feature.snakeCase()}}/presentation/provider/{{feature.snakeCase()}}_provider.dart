import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart'; 
import '../../index.dart';
{{#create_bases}}import '../../../../core/{{use_case.snakeCase()}}.dart';{{/create_bases}}
{{#create_bases}}import '../../../../core/{{provider_status.snakeCase()}}.dart';{{/create_bases}}

class {{feature.pascalCase()}}Provider extends ChangeNotifier {

  {{feature.pascalCase()}}Provider({required this.get{{feature.pascalCase()}}UseCase});

  final Get{{feature.pascalCase()}}UseCase get{{feature.pascalCase()}}UseCase;

  {{feature.pascalCase()}}State state = {{feature.pascalCase()}}State();

  Future<void> load() async{
    state = state.copyWith(status: {{provider_status.pascalCase()}}.loading);
    notifyListeners();
    final result = await get{{feature.pascalCase()}}UseCase(NoParams());
    result.fold((failure){
      state = state.copyWith(status: {{provider_status.pascalCase()}}.failure, failure: failure);
      notifyListeners();
    },
    (success) {
      state = state.copyWith(status: {{provider_status.pascalCase()}}.success, {{feature.camelCase()}}: success);
      notifyListeners();
    },
    );
  }
}