import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart'; 
import '../../../index.dart';

{{#create_bases}}import '../../../../core/{{use_case.snakeCase()}}.dart';{{/create_bases}}
{{#create_bases}}import '../../../../core/{{provider_status.snakeCase()}}.dart';{{/create_bases}}

class {{feature.pascalCase()}}Provider extends ChangeNotifier {

  {{feature.pascalCase()}}Provider({
    {{#operations}}
    required this.{{..camelCase()}}{{feature.pascalCase()}}UseCase,
    {{/operations}}
  });

  {{#operations}}
  final {{..pascalCase()}}{{feature.pascalCase()}}UseCase {{..camelCase()}}{{feature.pascalCase()}}UseCase;{{/operations}}

  {{feature.pascalCase()}}State state = {{feature.pascalCase()}}State();

  {{#operations}}
  Future<void> {{..camelCase()}}() async{
    state = state.copyWith(status: {{provider_status.pascalCase()}}.loading);
    notifyListeners();
    final result = await {{..camelCase()}}{{feature.pascalCase()}}UseCase(NoParams());
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
  {{/operations}}
}