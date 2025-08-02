
class LoginResponse {
  String? type;
  Properties? properties;

  LoginResponse({this.type, this.properties});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        type: json['type'] as String?,
        properties: json['properties'] == null
            ? null
            : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'properties': properties?.toJson(),
      };
}
class Data {
  String? type;

  Data({this.type});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
      };
}
class Message {
  String? type;

  Message({this.type});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
      };
}


class Properties {
  Message? message;
  Data? data;

  Properties({this.message, this.data});

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        message: json['message'] == null
            ? null
            : Message.fromJson(json['message'] as Map<String, dynamic>),
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message?.toJson(),
        'data': data?.toJson(),
      };
}
