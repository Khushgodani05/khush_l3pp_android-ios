import 'dart:developer';

import 'package:cart/Product_cart/model/product.dart';
import 'package:cart/Product_cart/view/cart_screen.dart';
import 'package:cart/Product_cart/view/product_List_tile.dart';
import 'package:flutter/material.dart';

Product getProductById(int id) {
  return products.where((element) => element.id == id).first;
}

final List<Product> products = [
 const  Product(
    id: 1,
    name: 'iPhone 16',
    price: 600,
    imagelink: "assets/images/iphone16.jpg" ,
  ),
  const Product(
    id: 2,
    name: 'Samsung S24',
    price: 500,
    imagelink: "assets/images/SamsungS24.jpg"
  ),
  const Product(
    id: 3,
    name: 'Nokia',
    price: 50,
    imagelink: "assets/images/nokia.png",
  ),
  const Product(
    id: 4,
    name: 'Oppo S19',
    price: 100,
    imagelink: "assets/images/oppof11.jpg",
  ),
 const  Product(
    id: 5,
    name: 'Vivo V25',
    price: 100,
    imagelink: "assets/images/VivoV20.jpg",
  ),
];

class Homescreens extends StatefulWidget {
  const Homescreens({super.key});


  @override
  State<Homescreens> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreens> {
  Map<int, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child:  Text('Home Screen',
          style: TextStyle(
            fontFamily: "khush",
            fontSize: 25,
            color: Colors.white
          ),
          ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log('button kisine press kiya');
            Navigator.of(context).push<Map<int, int>>(
              MaterialPageRoute(
                builder: (context) {
                  return CartScreen(cart: cart);
                },
              ),
            ).then((value) {
              setState(() {
                if (value != null) {
                  cart = value;
                }
              });
            });
          },
          child: const Icon(Icons.shopping_bag,
          color: Colors.blueAccent,),
        ),
        body:ListView.separated(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductListTile(
              product: product,
              quantity: getQuantity(product),
              onTapAdd: () => addItemButtonClickEvent(product),
              onTapRemove: () => removeItemButtonClickEvent(product),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
        ),
        );
  }

  void addItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        // cart mai pehle seh hai kuch quantity ke saath
        final quantity = cart[product.id] as int;
        cart[product.id] = quantity + 1;
      } else {
        // cart mai nhi hai
        cart[product.id] = 1;
      }
    });
  }

  void removeItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        // cart mai pehle seh hai kuch quantity ke saath
        final quantity = cart[product.id] as int;
        if (quantity > 0) {
          cart[product.id] = quantity - 1;
        } else {
          cart.remove(product.id);
        }
      }
    });
  }

  int getQuantity(Product product) {
    if (cart.containsKey(product.id)) {
      // cart mai pehle seh hai kuch quantity ke saath
      return cart[product.id] as int;
    } else {
      return 0;
    }
  }
}