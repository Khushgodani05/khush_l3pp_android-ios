// ignore_for_file: camel_case_types
//interface
abstract class Dominos {
  var name;
  Dominos(this.name){
    print("*****-----welcome to dominossss----*****");
    print("preparing $name.......");
  }
  void getbread(String braedType);  

  void addsauces(String sauce);

  void toppings(String top1, [String top2="Garlic",String top3="paneer",String top4="cheese"] );
  
  void bye();
  }

 

class Pizza extends Dominos {
  Pizza(String name):super(name);
  void ready(String name){
     print("$name readyyyy...........:)");
  }
  
  void getbread(String braedType){
    print("Getting $braedType braed readyyyy...");
  }
  
  void addsauces(String sauce){
    print("Adding $sauce sauce....");
  }

  void toppings(String top1, [String top2="Garlic",String top3="paneer",String top4="cheese"] ){
    print("Adding $top1 ,$top2 ,$top3 ,$top4.......");
  }
 
void bye()
{
  print("Thank you for ordering!!!!");
  print("Do visit us again!!!!");
  print("-----------------------------------------------------");
}
}


class Garlicbread extends Dominos { 
  Garlicbread(String name):super(name);
  void ready(String name){
     print("$name readyyyy...........:)");
  }
  void getbread(String braedType){
    print("Getting $braedType braed readyyyy...");
  }
  
  void addsauces(String sauce){
    print("Adding $sauce sauce....");
  }

  void toppings(String top1, [String top2="Garlic",String top3="paneer",String top4="cheese"] ){
    print("Adding $top1 ,$top2 ,$top3 ,$top4.......");
  }
 void bye()
{
  print("Thank you for ordering!!!!");
  print("Do visit us again!!!!");
  print("-----------------------------------------------------");
}
}


void main(){
  var name;
  Pizza ppp=Pizza("peppypanner");
  ppp.getbread("wheat");
  ppp.addsauces("pizza-pasta");
  ppp.toppings("jalepine,chilli flakes");
  name=ppp.name;
  ppp.ready(name);
  ppp.bye();
  Garlicbread ppp2=Garlicbread("Garlicbread");
  ppp2.getbread("Italian");
  ppp2.addsauces("mayonnise");
  ppp2.toppings("Oregano");
  name=ppp2.name;
  ppp.ready(name);
  ppp.bye();
}
