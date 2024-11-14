import 'package:flutter/material.dart';

class Userinfo {

  final String userId;
  final String userType;
  final String userWorkDiv;
  final String businessNumber;

  Userinfo({
    required this.userId, required  this.userType, required  this.userWorkDiv, required this.businessNumber,
  });

  factory Userinfo.fromJson(Map<String, dynamic> json) {
    return Userinfo(
      userId: json['UserId'],
      userType: json['userType'],
      userWorkDiv: json['userWorkDiv'],
      businessNumber: json['businessNumber'],
    );
  }

}