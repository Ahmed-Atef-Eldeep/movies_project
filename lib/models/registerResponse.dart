/// message : "User created successfully"
/// data : {"email":"amr9025@gmail.com","password":"$2b$10$86MBUrxdsiXf0kLEI9ugwu20Tj2Fz9Wo.FSe1NHEPiO/qaM.t3Cui","name":"amr mustafa","phone":"+201141209334","avaterId":1,"_id":"685981c6e9a1feaaffe19ed5","createdAt":"2025-06-23T16:33:10.063Z","updatedAt":"2025-06-23T16:33:10.063Z","__v":0}

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.data,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// email : "amr9025@gmail.com"
/// password : "$2b$10$86MBUrxdsiXf0kLEI9ugwu20Tj2Fz9Wo.FSe1NHEPiO/qaM.t3Cui"
/// name : "amr mustafa"
/// phone : "+201141209334"
/// avaterId : 1
/// _id : "685981c6e9a1feaaffe19ed5"
/// createdAt : "2025-06-23T16:33:10.063Z"
/// updatedAt : "2025-06-23T16:33:10.063Z"
/// __v : 0

class Data {
  Data({
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avatarId, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avatarId = json['avatarId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avatarId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avatarId'] = avatarId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}