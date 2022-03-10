import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends INetworkModel {
  final String? email;
  final String? password;
  LoginRequestModel({this.email, this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);
}
