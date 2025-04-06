import 'package:api_practise/view/detail_page.dart';
import 'package:api_practise/view_model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return Scaffold(
       appBar: AppBar(
        title: Text("Users List"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
       ),
       body: userProvider.isloading? 
       Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(),
            Text("Loading Users ...."),
          ],
        )
        )
        : 
        ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (context,index){
            final user=userProvider.users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.picture),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  ),
                  Text("Age : ${user.age}",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:(context)=> DetailPage(selectedUser: user),
                    )
                );
              },
            );
          }
          ),
          floatingActionButton: ElevatedButton(
            onPressed: (){
              userProvider.fetchUser();
            }, 
            child: Icon(Icons.get_app)
            ),
    );
 }
  
}