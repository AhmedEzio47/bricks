import 'package:dartz/dartz.dart'; 
import '../../index.dart';

class Get{{feature.pascalCase()}}UseCase implements {{use_case.pascalCase()}}<{{feature.pascalCase()}}Entity, NoParams> {

  const Get{{feature.pascalCase()}}UseCase(this.repo);

  final {{feature.pascalCase()}}Repo repo;
  
  @override
  Future<Either<Failure, {{feature.pascalCase()}}Entity>> call(NoParams params){
    return repo.get{{feature.pascalCase()}}();
  }
}