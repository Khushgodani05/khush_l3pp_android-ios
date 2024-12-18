import 'package:cart/Product/product.dart';
import 'package:cart/screens/homescreen.dart';
import 'package:flutter/material.dart';


class Cartscreen extends StatefulWidget {

  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _Cartscreen();
}

class _Cartscreen extends State<Cartscreen> {


  // for(Product productsp<=products.length){}
  getProductInfo(index){
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(products[index].name,
          style: const TextStyle(
            fontSize: 18,
          ),
          ),
          Text("${Product.currency}${products[index].price}",
          style: const TextStyle(
            fontSize: 13,
          ),
          ),
          ],
      );
  }

  addItem(int index){
    setState(() {
      
    });
products[index].quantity=products[index].quantity+1;
  }

  removeItem(int index){
    setState(() {
        products[index].quantity=products[index].quantity > 0 ? products[index].quantity-1 :products[index].quantity;
    });
    return products;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Row(
            children: [
              Text("Cart Screen"),
            ],
          ),
        ),
        body:cartListBuilder(),
      );
   
  }

  ListView cartListBuilder() {
    return ListView.separated(itemCount: products.length,
      itemBuilder: (context,index){
        if(products[index].quantity>0){
        return cartListTile(index);
      }
        else {
         return const Text("No items in the cart",
          style: TextStyle(
          fontFamily: "khush",
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        );
      
        }
      },
      separatorBuilder:(BuildContext context, int index){
        return const Divider(
          height: 2,
        );
      } 
      );
  }

  ListTile cartListTile(int index) {
    return ListTile(
       leading: Text("$index"),
              contentPadding: const EdgeInsets.all(5),
              title: Row(
                children: [
                 getProductInfo(index),
                 const Spacer(),
                 ElevatedButton(
                  onPressed:()=> addItem(index),
                  child:  const Icon(Icons.add),
                  ),
                const Padding(padding: EdgeInsets.all(4)),
                 Text("${products[index].quantity}"),
                 const Padding(padding: EdgeInsets.all(4)),
                 ElevatedButton(
                  onPressed:()=> removeItem(index), 
                  child: const Icon(Icons.remove),
                  )
                ],
              ) 
             );
  }

}