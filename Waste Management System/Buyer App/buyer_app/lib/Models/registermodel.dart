import 'dart:convert';



UserModel userModelFromJson(String str)=> UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data)=> json.encode(data.toJson());

class UserModel {

  String username;
  String address;
  String phone;
  String password;
  String confirmpass;
  String email;
  String location;
  String city;

  UserModel({

    this.username,
    this.address,
    this.phone,
    this.password,
    this.confirmpass,
    this.email,
    this.location,
    this.city,

  });

  factory UserModel.fromJson(Map<String, dynamic>json)=> UserModel(
    username: json["username"],
    address: json["address"],
    phone: json["phone"],
    password: json["password"],
    confirmpass: json["confirmpass"],
    email: json["email"],
    location: json["location"],
    city: json["city"],

  );
  Map<String, dynamic>toJson() =>{
    "username" :username,
    "address" :address,
    "phone" :phone,
    "password" :password,
    "confirmpass" :confirmpass,
    "email" :email,
    "location" :location,
    "city" :city,


  };


}