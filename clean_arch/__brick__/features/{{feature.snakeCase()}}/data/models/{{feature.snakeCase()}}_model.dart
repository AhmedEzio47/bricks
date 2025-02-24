import '../../index.dart';

class {{feature.pascalCase()}}Model extends {{feature.pascalCase()}}Entity{
  const {{feature.pascalCase()}}Model ({
    {{#properties}} super.{{name.camelCase()}},
    {{/properties}}
  });

  factory {{feature.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feature.pascalCase()}}Model(
      {{#properties}}{{name.camelCase()}}: json['{{name.snakeCase()}}'] as {{{type}}}?,
      {{/properties}}
    );
  }
}