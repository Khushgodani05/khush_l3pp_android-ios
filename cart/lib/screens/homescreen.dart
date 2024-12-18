import 'package:cart/Product/product.dart';
import 'package:cart/screens/cartscreen.dart';
import 'package:flutter/material.dart';


List<Product> products=[
    Product(id: 1,  price: 700, name: "Iphone", quantity: 0,imageLink: "iphone16.jpg"),
    Product(id: 2, price: 600, name: "Samsung S24", quantity: 0,imageLink: "SamsungS24.jpg"),
    Product(id: 3, price: 450, name: "Vivo V20", quantity: 0, imageLink: "VivoV20.jpg"),
    Product(id: 4, price: 350, name: "Oppo F11", quantity: 0, imageLink: "oppof11.jpg")
];

class Homescreen extends StatefulWidget{

  const Homescreen({super.key});

  @override
  State<StatefulWidget> createState() =>_ShoppingApp();
}

class _ShoppingApp extends State<Homescreen>{

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
    });
    return products[index].quantity=products[index].quantity > 0 ? products[index].quantity-1 :products[index].quantity;

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:Text("My Shopping app",
          style: TextStyle(
            fontFamily:"khush",
            fontSize: 25, 
            color: Colors.white,
          ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
            itemCount: products.length,
            itemBuilder:(context,index){ 
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
            }, 
            separatorBuilder: (BuildContext context, int index) { 
              return const Divider(height: 2);
             }, 
            ),
            floatingActionButton: FloatingActionButton(onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  const Cartscreen();
              }
              ),
              );
            },
           child: const Icon(Icons.shopping_bag, color: Colors.blue,),
           ),
       
      );

  }

}