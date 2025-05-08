{{#isProvider}}export 'provider/index.dart';{{/isProvider}}
{{#isBloc}}export 'bloc/index.dart';{{/isBloc}}
export 'widgets/index.dart';
export '{{feature.snakeCase()}}_screen.dart';
