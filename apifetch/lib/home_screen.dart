import 'package:apifetch/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider= Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List",
        style: TextStyle(
          fontSize: 25,
        ),
        ),
      ),
      body: userProvider.loadingUser? const Center(child: CircularProgressIndicator()) :
      ListView.builder(
        itemCount: userProvider.userList.length,
        itemBuilder: (context,index){
          final user=userProvider.userList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        }
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()=> userProvider.fetchUser(), child: const Icon(Icons.get_app),),
    );
  }
}