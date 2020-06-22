import 'dart:convert';



UserModel userModelFromJson(String str)=> UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data)=> json.encode(data.toJson());

class UserModel {

String firstname;
String lastname;
String email;
String contactNumber;
String password; 
String address1;
String address2;
String city;
String district;

UserModel({

this.firstname,
this.lastname,
this.email,
this.contactNumber,
this.password,
this.address1,
this.address2,
this.city,
this.district,

});

factory UserModel.fromJson(Map<String, dynamic>json)=> UserModel(
firstname: json["firstname"],
lastname: json["lastname"],
email: json["email"],
contactNumber: json["contactNumber"],
password: json["password"],
address1: json["address1"],
address2: json["address2"],
city: json["city"],
district:json["district"],

);
Map<String, dynamic>toJson() =>{
  "firstname" :firstname,
  "lastname" :lastname,
  "email" :email,
  "contactNumber" :contactNumber,
  "password" :password,
  "address1" :address1,
  "address2" :address2,
  "city" :city,
  "district":district,


};


}