import 'package:flutter/material.dart';
{{#isProvider}}import 'package:provider/provider.dart';{{/isProvider}}
{{#isBloc}}import 'package:flutter_bloc/flutter_bloc.dart';{{/isBloc}}
import '../index.dart';

class {{feature.pascalCase()}}Screen extends StatelessWidget {
const {{feature.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    {{#isProvider}}
    return ChangeNotifierProvider(
      create:
          (_) => {{feature.pascalCase()}}Provider(
            get{{feature.pascalCase()}}UseCase: di(),
          )..load(),
      child: {{feature.pascalCase()}}Content(),
    );
    {{/isProvider}}

    {{#isBloc}}
    return BlocProvider(
      create: (_) => {{feature.pascalCase()}}Bloc(
      {{#operations}}
      {{..camelCase()}}{{feature.pascalCase()}}UseCase: di(),
      {{/operations}}
      ),
      child: {{feature.pascalCase()}}Content(),
    );
    {{/isBloc}}
  }
}
