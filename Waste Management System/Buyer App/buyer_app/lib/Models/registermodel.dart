import 'dart:convert';

// user model

UserModel userModelFromJson(String str)=> UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data)=> json.encode(data.toJson());

class UserModel {

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;
  String address1;
  String address2;
  String city;
  String district;

  UserModel({

    this.firstname,
    this.lastname,
    this.contactNumber,
    this.password,
    this.confirmpass,
    this.email,
    this.address1,
    this.address2,
    this.city,
    this.district,

  });

  factory UserModel.fromJson(Map<String, dynamic>json)=> UserModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    contactNumber: json["contactNumber"],
    password: json["password"],
    confirmpass: json["confirmpass"],
    email: json["email"],
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    district: json["district"],

  );
  Map<String, dynamic>toJson() =>{
    "firstname" :firstname,
    "lastname" :lastname,
    "contactNumber" :contactNumber,
    "password" :password,
    "confirmpass" :confirmpass,
    "email" :email,
    "address1" :address1,
    "address2" :address2,
    "city" :city,
    "district" :district,

  };
}

// user model tracking

UserModelTrack userModelTrackFromJson(String str)=> UserModelTrack.fromJson(json.decode(str));

String userModelTrackToJson(UserModelTrack data)=> json.encode(data.toJson());

class UserModelTrack {

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;
  String currentAddress;

  UserModelTrack({

    this.firstname,
    this.lastname,
    this.contactNumber,
    this.password,
    this.confirmpass,
    this.email,
    this.currentAddress,

  });

  factory UserModelTrack.fromJson(Map<String, dynamic>json)=> UserModelTrack(
    firstname: json["firstname"],
    lastname: json["lastname"],
    contactNumber: json["contactNumber"],
    password: json["password"],
    confirmpass: json["confirmpass"],
    email: json["email"],
    currentAddress: json["currentAddress"],


  );
  Map<String, dynamic>toJson() =>{
    "firstname" :firstname,
    "lastname" :lastname,
    "contactNumber" :contactNumber,
    "password" :password,
    "confirmpass" :confirmpass,
    "email" :email,
    "currentAddress" :currentAddress,


  };
}

// company model

CompanyModel companyModelFromJson(String str)=> CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data)=> json.encode(data.toJson());

class CompanyModel {

  String companyName;
  String contactpersonName;
  String contactpersonNumber;
  String password;
  String confirmpass;
  String email;
  String address1;
  String address2;
  String city;
  String district;

  CompanyModel({

    this.companyName,
    this.contactpersonName,
    this.contactpersonNumber,
    this.password,
    this.confirmpass,
    this.email,
    this.address1,
    this.address2,
    this.city,
    this.district,

  });

  factory CompanyModel.fromJson(Map<String, dynamic>json)=> CompanyModel(
    companyName: json["companyName"],
    contactpersonName: json["contactpersonName"],
    contactpersonNumber: json["contactpersonNumber"],
    password: json["password"],
    confirmpass: json["confirmpass"],
    email: json["email"],
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    district: json["district"],

  );
  Map<String, dynamic>toJson() =>{
    "companyName" :companyName,
    "contactpersonName" :contactpersonName,
    "contactpersonNumber" :contactpersonNumber,
    "password" :password,
    "confirmpass" :confirmpass,
    "email" :email,
    "address1" :address1,
    "address2" :address2,
    "city" :city,
    "district" :district,


  };


}