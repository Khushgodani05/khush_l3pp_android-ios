import 'package:firebase_google_authentications/modules/Home/view/home_screen.dart';
import 'package:firebase_google_authentications/modules/authorization/view/auth_screen.dart';
import 'package:firebase_google_authentications/modules/authorization/view_model/auth_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthGaurd extends StatefulWidget {
  const AuthGaurd({super.key});

  @override
  State<AuthGaurd> createState()=>_Authgaurd();
}

class _Authgaurd extends State<AuthGaurd>{

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<AuthViewModel>().getUser();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel,bool>(
      selector: (context,viewModel) => viewModel.isAuthenticated,
      builder: (context,isAuthenticated,child){
        if(!isAuthenticated) return const AuthScreen();
        return const HomeScreen();
      },
      );
  }
}