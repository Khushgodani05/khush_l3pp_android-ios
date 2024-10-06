class Fruits {
    static String names="Khush godani";
    var fruit_name;
    var colour;
//Default / parameter constructor
    Fruits(this.fruit_name) {
        print("Welcome to fruit class");
    }
//named constructor
    Fruits.withcolor(this.fruit_name,this.colour) {
        print("-------------------------------------");
        print("I am from named construcutor.");
        print("I am $fruit_name , I am $colour in colour.");
    }
    String name()=> "I am $fruit_name";

    color(String color) {
        this.colour=color;
        return colour;
    }

    void season(String season) {
        print("I comes in $season.");
    }
}

class Bio {
    var id=1;
    var name;
    Bio._internal();
    static final Bio _instance= Bio._internal();
    factory Bio() {
        return _instance;
    }

    int userid() {
        return id++;
    }

    String username(String name) {
        this.name=name;
        return name;
    }
}

void main() {
    print("Hi , I am ${Fruits.names}.");
    Fruits fruit=Fruits("Mango");
    print(fruit.name());
    print("I am ${fruit.color("yellow")} in colour");
    fruit.season("Summer");
    Fruits fruits=Fruits("Grapes");
    print(fruits.name());
    print("I am ${fruit.color("Black/Green")} in colour");
    fruit.season("Winter");
    Fruits.withcolor("Apple", "Red");
    print("-------------------------------------");
    print("I am from factory constructor");
    Bio user=Bio();
    print("User-id : ${user.userid()} Username : ${user.username("Khush")}");
    Bio user1=Bio();
    print(user1.name);
    print("User-id : ${user1.userid()} Username : ${user1.username("Vinayak sir")}");
    print("User-id : ${user.userid()} Username : ${user.username("Satyendra sir")}");
    print("User-id : ${user.userid()} Username : ${user1.username("Vedant bhaiya")}");
    print(user1.hashCode);
    print(user.hashCode);


}