import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision/view/counterApp.dart';
import 'package:revision/viewmodel/counterProvider.dart';

class CounterAppProvider extends StatelessWidget {
  const CounterAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (content)=>CounterProvider(),
      child:  const Counterapp() ,
      );
  }
}