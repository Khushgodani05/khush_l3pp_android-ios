import 'package:restaurant/category_model.dart';
import 'package:restaurant/menu_model.dart';
import 'package:restaurant/practise.dart';

class MyrestaurantService {
  MyrestaurantService._();

  static final _instance = MyrestaurantService._();
  factory MyrestaurantService() => _instance;

  final database= MyRestaurantDatabase();
  Map <Menumodel,int> cart={};

  int? getQuantity(Menumodel menus){
    return cart[menus];
  }
  
  //  void addMenuToCart(int id) {
  //   final map = database.findMenuById(id);
  //   if (map == null) return;

  //   final menu = MenuModel.fromMap(map);
  //   if (cart.containsKey(menu)) {
  //     cart[menu] = cart[menu]! + 1;
  //   } else {
  //     cart.addAll({
  //       menu: 1,
  //     });
  //   }
  // } 
  void addMenuToCart(int id){
     final map=database.findMenuById(id);
     if(map==null) return;
     final menu=Menumodel.fromMap(map);
     if(cart.containsKey(menu)){
      cart[menu]=cart[menu]! + 1;
     }
     else {
      cart.addAll({
        menu:1,
      });
     }

  }

  
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (final entry in cart.entries) {
      totalPrice = totalPrice + (entry.key.price * entry.value);
    }
    return totalPrice;
  }

  List<Menumodel> getMenusFromCategory(int categoryId) {
    return getAllMenus()
        .where((element) => element.categoryId == categoryId)
        .toList();
  }

  List<Categorymodel> getAllCategories() {
    return database.categories.values
        .map((value) => Categorymodel.fromMap(value))
        .toList();
  }

  List<Menumodel> getAllMenus() {
    return database.menus.values
        .map((value) => Menumodel.fromMap(value))
        .toList();
  }

}