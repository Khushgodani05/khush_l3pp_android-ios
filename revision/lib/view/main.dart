import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision/view/application.dart';
import 'package:revision/viewmodel/ThemeProvider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (content)=>Themeprovider(),
    child: const MyApplication(),
  ),
    );
}