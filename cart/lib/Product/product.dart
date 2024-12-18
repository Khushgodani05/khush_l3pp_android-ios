class Product{
  final int id;
  final double price;
  final String name;
  static String currency="\$";
  int quantity;
  String imageLink;

  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.quantity,
    required this.imageLink,
  }
  );


}

