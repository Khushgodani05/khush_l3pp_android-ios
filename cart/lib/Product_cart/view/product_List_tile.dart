
import 'package:cart/Product_cart/model/product.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key,
  required this.onTapAdd,
  required this.onTapRemove,
  required this.product,
  required this.quantity,
  });
  final int quantity;
  final VoidCallback onTapAdd;
  final VoidCallback onTapRemove;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Image(image: AssetImage(product.imagelink))),
      title: Row(
        children: [
          Column(
            children: [
              Text(product.name),
              Row(
                children: [
                  Text(product.currency),
                  Text("${product.price}"),
                ],
              ),
            ],
            ),
            const Spacer(),
            FloatingActionButton(onPressed: onTapAdd,child: const Icon(Icons.add)),
            const SizedBox(width: 10,),
            Text("$quantity"),
            const SizedBox(width: 10,),
            FloatingActionButton(onPressed: onTapRemove,child: const Icon(Icons.remove)),
            
        ],
      ),
    );
  }
}