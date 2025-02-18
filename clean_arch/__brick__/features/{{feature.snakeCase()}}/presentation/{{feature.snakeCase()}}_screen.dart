import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../index.dart';

class {{feature.pascalCase()}}Screen extends StatelessWidget {
const {{feature.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => {{feature.pascalCase()}}Provider(
            get{{feature.pascalCase()}}UseCase: di(),
          )..load(),
      child: {{feature.pascalCase()}}Content(),
    );
  }
}
