class ChatModel {
  final String id;

  const ChatModel({required this.id});

  factory ChatModel.fromMap(Map<String,dynamic> map){
    return ChatModel(
      id: map['id'] as String,
      );
  }

  Map<String,dynamic>toMap(){
    return {
      'id':id,
    };
  }
}