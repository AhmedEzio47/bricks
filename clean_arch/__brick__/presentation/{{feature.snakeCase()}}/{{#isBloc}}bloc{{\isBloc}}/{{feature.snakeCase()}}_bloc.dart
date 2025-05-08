
import '../../../index.dart';
{{#create_bases}}import '../../../../core/{{use_case.snakeCase()}}.dart';{{/create_bases}}
{{#create_bases}}import '../../../../core/{{provider_status.snakeCase()}}.dart';{{/create_bases}}
import 'package:flutter_bloc/flutter_bloc.dart';

class {{feature.pascalCase()}}Bloc extends Bloc<{{feature.pascalCase()}}Event, {{feature.pascalCase()}}State> {
  {{feature.pascalCase()}}Bloc({
    {{#operations}}
    required this.{{..camelCase()}}{{feature.pascalCase()}}UseCase,
    {{/operations}}
  }) : super(const {{feature.pascalCase()}}State()) {
    {{#operations}}
    on<{{..pascalCase()}}{{feature.pascalCase()}}Event>(_on{{..pascalCase()}});{{/operations}}
  }

  {{#operations}}
  final {{..pascalCase()}}{{feature.pascalCase()}}UseCase {{..camelCase()}}{{feature.pascalCase()}}UseCase;{{/operations}}

  {{#operations}}
  Future<void> _on{{..pascalCase()}}(
    {{..pascalCase()}}{{feature.pascalCase()}}Event event,
    Emitter<{{feature.pascalCase()}}State> emit,
  ) async {
    emit(
      state.copyWith(
        status: {{provider_status.pascalCase()}}.loading,
      ),
    );
    final result = await {{..camelCase()}}{{feature.pascalCase()}}UseCase(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: {{provider_status.pascalCase()}}.failure,
          failure: failure,
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: {{provider_status.pascalCase()}}.success,
          {{feature.camelCase()}}: success,
        ),
      ),
    );
  }
  {{/operations}}
}
