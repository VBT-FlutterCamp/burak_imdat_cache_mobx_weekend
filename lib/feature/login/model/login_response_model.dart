import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel {
  final String? token;
  LoginResponseModel({this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}
