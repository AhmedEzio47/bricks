import 'package:dartz/dartz.dart'; 
import '../../index.dart';
{{#create_bases}}import '../../../../core/{{failure.snakeCase()}}.dart';{{/create_bases}}

abstract interface class {{feature.pascalCase()}}Repo {
  {{#operations}}
  Future<Either<{{failure.pascalCase()}}, {{feature.pascalCase()}}Model>> {{.}}{{feature.pascalCase()}}();
  {{/operations}}
}