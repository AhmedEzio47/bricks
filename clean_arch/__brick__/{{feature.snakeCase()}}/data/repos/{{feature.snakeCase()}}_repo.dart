abstract interface class {{feature.pascalCase()}}Repo {
  Future<Either<Failure, {{feature.pascalCase()}}Model>> get{{feature.pascalCase()}}();
}