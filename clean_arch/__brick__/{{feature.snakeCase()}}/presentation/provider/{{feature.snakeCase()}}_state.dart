import '../../index.dart';

class {{feature.pascalCase()}}State extends BaseState {

  const {{feature.pascalCase()}}State({
    super.status = ProviderStatus.initial,
    super.failure,
    this.{{feature.camelCase()}},
  });

  final {{feature.pascalCase()}}Entity {{feature.camelCase()}};

  {{feature.pascalCase()}}State copyWith({
    ProviderStatus? status,
    Failure? failure,
    {{feature.pascalCase()}}Entity? {{feature.camelCase()}},
  }) => {{feature.pascalCase()}}State(
    status: status ?? this.status,
    failure: failure ?? this.failure,
    {{feature.camelCase()}}: {{feature.camelCase()}} ?? this.{{feature.camelCase()}},
    );
}