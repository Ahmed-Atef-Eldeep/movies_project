import 'properties.dart';

class Login {
  String? type;
  Properties? properties;

  Login({this.type, this.properties});

  // factory Login.fromJson(Map<String, dynamic> json) => Login(
  //       type: json['type'] as String?,
  //       properties: json['properties'] == null
  //           ? null
  //           : Properties.fromJson(json['properties'] as Map<String, dynamic>),
  //     );

  // Map<String, dynamic> toJson() => {
  //       'type': type,
  //       'properties': properties?.toJson(),
  //     };
}
