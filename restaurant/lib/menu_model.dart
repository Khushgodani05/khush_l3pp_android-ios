class Menumodel {
  final int id;
  final String name;
  final double price;
  final int currency;
  final int categoryId;

  const Menumodel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.currency,
  });
   

  factory Menumodel.fromMap(Map<String,dynamic> map){
    return Menumodel(id: map['id'] as int,
    name: map['name'] as String,
     categoryId: map['categoryId'] as int,
      price: map['price'] as double , 
      currency: map['currency'] as int,
      );
  }

   @override
  int get hashCode => Object.hashAll(
        [id, name, currency, price, categoryId],
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Menumodel && other.id == id;
  }


}