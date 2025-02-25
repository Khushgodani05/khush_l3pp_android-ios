import 'package:firebase_google_authentications/chat/view/chat_screen_body.dart';
import 'package:firebase_google_authentications/chat/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState()=>_ChatScreen();

}

class _ChatScreen extends State<ChatScreen>{
   
   @override
    void initState(){
    super.initState();
    Future.microtask(
      (){
        if(mounted) {
          context.read<ChatViewModel>().init();
        }
      }
    );
   }
   
     @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.read<ChatViewModel>().reciever.email ?? context.read<ChatViewModel>().reciever.id
        ),
      ),
      body: Selector<ChatViewModel,bool>(
        builder: (context,isChatCreated,child){
          if(isChatCreated) return const ChatScreenBody();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, 
        selector: (_,vm)=>vm.isChatCreated,
        ),
    );
     }
}