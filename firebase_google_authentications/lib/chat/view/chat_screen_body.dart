import 'package:firebase_google_authentications/chat/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {

  final messageValue=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.lightGreen,
        ),
        Container(
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            children: [
              TextField(
                controller: messageValue,
                decoration:const InputDecoration(
                  hintText:"type your message here ...",
                ),
                onChanged: (value){

                },
              ),
              IconButton(
                onPressed: ()async {
                  final message=messageValue.text.trim();
                  await context.read<ChatViewModel>().sendMessageEvent(message);
                }, 
                icon: const Icon(Icons.send)
                ),
            ],
          ),
        )
      ],
    );
  }
}