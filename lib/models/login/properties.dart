import 'data.dart';
import 'message.dart';

class Properties {
  Message? message;
  Data? data;

  Properties({this.message, this.data});

  // factory Properties.fromJson(Map<String, dynamic> json) => Properties(
  //       message: json['message'] == null
  //           ? null
  //           : Message.fromJson(json['message'] as Map<String, dynamic>),
  //       data: json['data'] == null
  //           ? null
  //           : Data.fromJson(json['data'] as Map<String, dynamic>),
  //     );

  // Map<String, dynamic> toJson() => {
  //       'message': message?.toJson(),
  //       'data': data?.toJson(),
  //     };
}
