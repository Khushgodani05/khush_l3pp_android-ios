// results: [
// {
// gender: "male",
// name: {
// title: "Monsieur",
// first: "Sandro",
// last: "Thomas"
// },
// location: {
// street: {
// number: 9392,
// name: "Rue Desaix"
// },
// city: "Büttikon",
// state: "Solothurn",
// country: "Switzerland",
// postcode: 4580,
// coordinates: {
// latitude: "-58.4119",
// longitude: "-95.0697"
// },
// timezone: {
// offset: "+3:00",
// description: "Baghdad, Riyadh, Moscow, St. Petersburg"
// }
// },
// email: "sandro.thomas@example.com",
// login: {
// uuid: "df8fb2a1-8356-4633-81d8-8d926f72867e",
// username: "ticklishleopard579",
// password: "active",
// salt: "FmwyymoF",
// md5: "1ed3c6f5e5833609758b1637adecf5f6",
// sha1: "cbf13e5bb1cdb3c7c0600b44d58ae42d81fcd635",
// sha256: "02963734de27f13043c58c7f6295465b2222a56d9853560d729f56f6cd901105"
// },
// dob: {
// date: "1990-11-07T19:29:10.797Z",
// age: 34
// },
// registered: {
// date: "2013-10-03T08:49:35.379Z",
// age: 11
// },
// phone: "079 415 44 96",
// cell: "078 761 31 01",
// id: {
// name: "AVS",
// value: "756.9733.4075.43"
// },
// picture: {
// large: "https://randomuser.me/api/portraits/men/12.jpg",
// medium: "https://randomuser.me/api/portraits/med/men/12.jpg",
// thumbnail: "https://randomuser.me/api/portraits/thumb/men/12.jpg"
// },
// nat: "CH"
// },
class User{
  final String name;
  final String email;
  final String picture;
  final String gender;
  final String country;
  final String coordinates;
  final String phone;

  const User({
    required this.name,
    required this.email,
    required this.picture,
    required this.gender,
    required this.country,
    required this.coordinates,
    required this.phone,
  });

  factory User.fromJson(Map<String,dynamic> map ){
    return User(
      name: map['name']['title'] + " " +map['name']['first'] + " " + map['name']['last'], 
      email: map['email'],  
      picture: map['picture']['medium'], 
      gender: map['gender'], 
      country: map['location']['country'], 
      coordinates: map['location']['coordinates']['latitude'] + " " + map['location']['coordinates']['longitude'], 
      phone: map['phone'],
      );
  }
  
}