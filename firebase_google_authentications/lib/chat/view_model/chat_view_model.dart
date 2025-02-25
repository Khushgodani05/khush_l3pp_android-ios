import 'package:firebase_google_authentications/chat/model/message_model.dart';
import 'package:firebase_google_authentications/chat/service/chat_firestone_service.dart';
import 'package:firebase_google_authentications/modules/authorization/model/user_model.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier{
  final _service=ChatFirestoneService();
  final UserModel reciever;
  ChatViewModel(this.reciever);
  String? chatId;
  Stream<List<MessageModel>> messages= Stream.empty();
  bool get isChatCreated=>chatId != null;

  void init() async{
    chatId=await _service.getChatId(reciever);
    loadMessage();
  }

  void loadMessage(){
    messages= _service.getAllChat(chatId);
    notifyListeners();
  }

  Future<void> sendMessageEvent(String message)async{
    if(!isChatCreated) return;
    await _service.sendMessage(chatId!, message, reciever);
  } 
}