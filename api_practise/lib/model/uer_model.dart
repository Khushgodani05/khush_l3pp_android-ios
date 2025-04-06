class User{
  final String gender;
  final String name;
  final String email;
  final String phone;
  final String picture;
  final String country;
  final int age;

  User({
    required this.age,
    required this.gender,
    required this.name,
    required this.email,
    required this.phone,
    required this.country,
    required this.picture,
  });

  factory User.fromJson(Map<String,dynamic> map){
    return User(
    gender: map['gender'], 
    name: map["name"]["title"] +" "+ map["name"]["first"] + " " + map["name"]['last'], 
    email: map['email'] , 
    picture: map["picture"]["large"],
    phone: map["phone"], 
    country: map['location']['country'], 
    age:map["dob"]["age"],
    );
  }
}