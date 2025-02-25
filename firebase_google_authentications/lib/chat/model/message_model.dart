class MessageModel {
  final String value;
  final String id;
  final String sentBy;
  final DateTime createdAt;
  
  const MessageModel({
    required this.id,
    required this.value,
    required this.createdAt,
    required this.sentBy,
  });

  factory MessageModel.fromMap( Map<String,dynamic> map){
    return MessageModel(
    id: map['id'] as String, 
    value: map['value'] as String, 
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int), 
    sentBy: map['sentBy'] as String,
    );
  }

  Map<String,dynamic> toMap(){
    return({
      "id":id,
      "value":value,
      "sentBy":sentBy,
      "createdAt":createdAt,
  });
  }

  
}