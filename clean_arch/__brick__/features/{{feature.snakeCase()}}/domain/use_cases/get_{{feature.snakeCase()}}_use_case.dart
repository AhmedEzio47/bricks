import 'package:dartz/dartz.dart'; 
import '../../index.dart';
{{#create_bases}}import '../../../../core/{{use_case.snakeCase()}}.dart';{{/create_bases}}
{{#create_bases}}import '../../../../core/{{failure.snakeCase()}}.dart';{{/create_bases}}

class Get{{feature.pascalCase()}}UseCase implements {{use_case.pascalCase()}}<{{feature.pascalCase()}}Entity, NoParams> {

  const Get{{feature.pascalCase()}}UseCase(this.repo);

  final {{feature.pascalCase()}}Repo repo;
  
  @override
  Future<Either<{{failure.pascalCase()}}, {{feature.pascalCase()}}Entity>> call(NoParams params){
    return repo.get{{feature.pascalCase()}}();
  }
}