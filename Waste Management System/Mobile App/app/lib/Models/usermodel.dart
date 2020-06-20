import 'dart:convert';



UserModel userModelFromJson(String str)=> UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data)=> json.encode(data.toJson());

class UserModel {

String firstname;
String lastname;
String username;
String phone;
String password; 
String address1;
String address2;
String city;

UserModel({

this.firstname,
this.lastname,
this.username,
this.phone,
this.password,
this.address1,
this.address2,
this.city,

});

factory UserModel.fromJson(Map<String, dynamic>json)=> UserModel(
firstname: json["firstname"],
lastname: json["lastname"],
username: json["username"],
phone: json["phone"],
password: json["password"],
address1: json["address1"],
address2: json["address2"],
city: json["city"],

);
Map<String, dynamic>toJson() =>{
  "firstname" :firstname,
  "lastname" :lastname,
  "username" :username,
  "phone" :phone,
  "password" :password,
  "address1" :address1,
  "address2" :address2,
  "city" :city,


};


}