class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.currency = '\$',
    required this.imagelink,
  });

  final int id;
  final String name;
  final double price;
  final String currency;
  final String imagelink;
}