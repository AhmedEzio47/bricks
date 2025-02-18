import 'package:dartz/dartz.dart'; 
import '../index.dart';

class {{feature.pascalCase()}}RepoImpl implements {{feature.pascalCase()}}Repo {
  
  @override
  Future<Either<Failure, {{feature.pascalCase()}}Model>> get{{feature.pascalCase()}}() {
    ///TODO: implement
    throw UnimplementedError();
  }
}