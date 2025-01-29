import 'dart:developer';

import 'package:cart/Product_cart/model/product.dart';
import 'package:cart/Product_cart/view/home_screens.dart';
import 'package:cart/Product_cart/view/product_List_tile.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    required this.cart,
  });

  final Map<int, int> cart;

  @override
  // ignore: no_logic_in_create_state
  State<CartScreen> createState() {
    log('createState');
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  Map<int, int> cart = {};

  @override
  void initState() {
    log('initState');
    super.initState();

    cart = widget.cart;
  }

  @override
  void didChangeDependencies() {
    log('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    log('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    log('dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    log('deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    log('build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text('Your cart',
        style: TextStyle(
            fontFamily: "khush",
            fontSize: 25,
            color: Colors.white
          ),
          ),
          ),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(cart);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: cart.entries.length,
        itemBuilder: (context, index) {
          final cartEntry = cart.entries.elementAt(index);
          final product = getProductById(cartEntry.key);
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
        if (quantity > 1) {
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