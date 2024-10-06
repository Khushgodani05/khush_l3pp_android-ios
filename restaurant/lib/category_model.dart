class Categorymodel {
  final int id;
  final String name;
  final String description;

  Categorymodel({
    required this.description,
    required this.id,
    required this.name,

});

  factory Categorymodel.fromMap(Map<String,dynamic> map){
    return Categorymodel(description: map['description'] as String,
     id: map['id'] as int,
    name: map['name']  as String,
    );
  }

}