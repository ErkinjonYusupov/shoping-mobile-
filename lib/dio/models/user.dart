import 'package:front_mobile/dio/models/addres.dart';
import 'package:front_mobile/dio/models/company.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id']??-1,
      name: json['name']??'error',
      username: json['username']??'error',
      email: json['email']??'error',
      address: Address.fromJson(json['address']),
      phone: json['phone']??'error',
      website: json['website']??'error',
      company: Company.fromJson(json['company'])
      );


}
List<User>userFromMap(List list)=>List<User>.from(list.map((item)=>User.fromJson(item)));
