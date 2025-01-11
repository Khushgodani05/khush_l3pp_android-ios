import 'package:apifetch/detail_screen.dart';
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
        backgroundColor: Colors.blue,
        title: Center(
          child: const Text(" API USERS FETCH",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          ),
        ),
      ),
      body: userProvider.loadingUser? const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.only(right: 10)),
          Text("Loading Users....",
          style: TextStyle(
            fontSize: 20
          ),)
        ],
      )) :
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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return DetailScreen(selecteduser: user);
                }
                )
              );
            },
          );
        }
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()=> userProvider.fetchUser(), child: const Icon(Icons.get_app),),
    );
  }
}