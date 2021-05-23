import 'dart:convert';



UserLoginRequestEntity userLoginRequestEntityFromJson(String str) => UserLoginRequestEntity.fromJson(json.decode(str));

String userLoginRequestEntityToJson(UserLoginRequestEntity data) => json.encode(data.toJson());

/// 登录请求
class UserLoginRequestEntity {
  UserLoginRequestEntity({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) => UserLoginRequestEntity(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}


UserLoginResponseEntity userLoginResponseEntityFromJson(String str) => UserLoginResponseEntity.fromJson(json.decode(str));

String userLoginResponseEntityToJson(UserLoginResponseEntity data) => json.encode(data.toJson());

/// 登录响应
class UserLoginResponseEntity {
  UserLoginResponseEntity({
    required this.accessToken,
    required this.channels,
    required this.displayName,
  });

  String accessToken;
  List<String> channels;
  String displayName;

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) => UserLoginResponseEntity(
    accessToken: json["accessToken"],
    channels: List<String>.from(json["channels"].map((x) => x)),
    displayName: json["displayName"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "channels": List<dynamic>.from(channels.map((x) => x)),
    "displayName": displayName,
  };
}

