
{{#create_bases}}import '../../../../core/{{failure.snakeCase()}}.dart';{{/create_bases}}
{{#create_bases}}import '../../../../core/{{provider_status.snakeCase()}}.dart';{{/create_bases}}
{{#create_bases}}import '../../../../core/{{base_state.snakeCase()}}.dart';{{/create_bases}}
import '../../../index.dart';

final class {{feature.pascalCase()}}State extends {{base_state.pascalCase()}} {

  const {{feature.pascalCase()}}State({
    super.status = {{provider_status.pascalCase()}}.initial,
    super.failure,
    this.{{feature.camelCase()}},
  });

  final {{feature.pascalCase()}}Entity? {{feature.camelCase()}};

  {{feature.pascalCase()}}State copyWith({
    ProviderStatus? status,
    {{failure.pascalCase()}}? failure,
    {{feature.pascalCase()}}Entity? {{feature.camelCase()}},
  }) => {{feature.pascalCase()}}State(
    status: status ?? this.status,
    failure: failure ?? this.failure,
    {{feature.camelCase()}}: {{feature.camelCase()}} ?? this.{{feature.camelCase()}},
    );
}