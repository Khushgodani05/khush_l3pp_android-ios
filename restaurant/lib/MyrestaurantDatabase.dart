class Myrestaurantdatabase {
 

 Map<int,dynamic>? findMenuById(int id){
    return menus[id];
 }

Map<int, dynamic> menus = {
    1: {
      "id": 1,
      "name": "Margherta Pizza",
      "currency": "₹",
      "price": 99.00,
      "categoryId": 1,
    },
    2: {
      "id": 2,
      "name": "Corn Cheese Pizza",
      "currency": "₹",
      "price": 150.00,
      "categoryId": 1,
    },
    3: {
      "id": 3,
      "name": "Roasted Pasta",
      "currency": "₹",
      "price": 89.00,
      "categoryId": 2,
    },
    4: {
      "id": 4,
      "name": "White Sauce Pasta",
      "currency": "₹",
      "price": 119.00,
      "categoryId": 2,
    },
    5: {
      "id": 5,
      "name": "Red Sauce Pasta",
      "currency": "₹",
      "price": 99.00,
      "categoryId": 2,
    },
    6: {
      "id": 6,
      "name": "Cold Drink",
      "currency": "₹",
      "price": 30.00,
      "categoryId": 3,
    },
  };
  Map<int,dynamic> category ={
    1:{
      "id":1,
      "name":"Pizza",
      "description":
                "Pizza is an Italian dish typically consisting of a flat base of leavened wheat-based dough topped with tomato, cheese, and other ingredients, baked at a high temperature, traditionally in a wood-fired oven.",

    },
     2: {
      "id": 2,
      "name": "Pasta",
      "description": " Pasta was traditionally only made with durum, although the definition has been expanded to include alternatives for a gluten-free diet, such as rice flour, or legumes such as beans or lentils.",
    },
    3: {
      "id": 3,
      "name": "Drink",
      "description": "to take liquid into the body through the mouth: He drank three glasses of water. The animals came down to the waterhole to drink.",
    },
  };
}