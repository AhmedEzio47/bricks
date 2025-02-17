import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart'; 
import '../../index.dart';

class {{feature.pascalCase()}}Provider extends ChangeNotifier {

  const {{feature.pascalCase()}}Provider({required this.get{{feature.pascalCase()}}UseCase});

  final Get{{feature.pascalCase()}}UseCase get{{feature.pascalCase()}}UseCase;

  {{feature.pascalCase()}}State state = {{feature.pascalCase()}}State();

  Future<void> load() async{
    state = state.copyWith(status: ProviderStatus.loading);
    notifyListeners();
    final result = await get{{feature.pascalCase()}}UseCase(NoParams());
    result.fold((failure){
      state = state.copyWith(status: ProviderStatus.failure, failure: failure);
      notifyListeners();
    },
    (success) {
      state = state.copyWith(status: ProviderStatus.success, {{feature.camelCase()}}: success);
      notifyListeners();
    },
    );
  }
}