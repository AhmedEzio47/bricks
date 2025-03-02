import 'package:dartz/dartz.dart'; 
import '../index.dart';
{{#create_bases}}import '../../../../core/{{failure.snakeCase()}}.dart';{{/create_bases}}

class {{feature.pascalCase()}}RepoImpl implements {{feature.pascalCase()}}Repo {
  
  @override
  Future<Either<{{failure.pascalCase()}}, {{feature.pascalCase()}}Model>> get{{feature.pascalCase()}}() {
    ///TODO: implement
    throw UnimplementedError();
  }
}