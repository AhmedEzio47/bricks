import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class {{feature.pascalCase()}}Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => {{feature.pascalCase()}}Provider(
            get{{feature.pascalCase()}}UseCase: di(),
          ),
      child: {{feature.pascalCase()}}Content(),
    );
  }
}
