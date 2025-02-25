import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_google_authentications/chat/model/chat_model.dart';
import 'package:firebase_google_authentications/chat/model/message_model.dart';
import 'package:firebase_google_authentications/modules/authorization/model/user_model.dart';
import 'package:firebase_google_authentications/modules/authorization/services/auth_service.dart';

class ChatFirestoneService {
  final _client=FirebaseFirestore.instance;
  final _authService= AuthService();

  Future<String?> getChatId(UserModel reciever) async{
    final sender=_authService.getUser();
    if(sender==null) return null;
    final senderId=sender.uid;
    final recieverId=reciever.id;
    final chatId=senderId.compareTo(recieverId)>=0
    ? '${senderId}_$recieverId'
    : '${recieverId}_$senderId';
    final chatRef=_client.collection("chats").doc(chatId);
    final isChatCreated= await chatRef.get().then((doc)=>doc.exists);
    if(isChatCreated) {
      return chatId;
    } else{
      final model=ChatModel(id: chatId);
      await chatRef.set(model.toMap());
      return  chatId;
    }
  }

  Future<void> sendMessage(String chatId, String message, UserModel reciever) async{
    final sender=UserModel.fromFirebaseUser(_authService.getUser()!);
    final ref=_client.collection("chats").doc(chatId).collection("messages");
    final docRef=ref.doc();
    final model=MessageModel(
    id: docRef.id, 
    value: message, 
    createdAt: DateTime.now(), 
    sentBy: sender.id,
    );
    await docRef.set(model.toMap());

  }

  // Query<MessageModel> getAllChatQuery(String? chatId){
  //   final sender=_authService.getUser();
  //   return _client.collection("chats").doc(chatId).collection("messages").
  //   orderBy('createdAt',descending: true).withConverter(
  //     fromFirestore: (snapshot,), 
  //     toFirestore: toFirestore
  //     );
  // }

  Stream<List<MessageModel>> getAllChat(String? chatId) {
    final ref=_client.collection("chats").doc(chatId).collection("messages").orderBy('createdAt',descending: true);
    final streamSnapshot=ref.snapshots();
    final stream=streamSnapshot.asyncMap(
      (snapshot){
        final messages=snapshot.docs.map(
          (doc){
            return MessageModel.fromMap(doc.data());
          }).toList();
        return messages;  
    }
    );
    return stream;
  
  }

}