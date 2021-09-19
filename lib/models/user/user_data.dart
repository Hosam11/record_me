import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData({
    required this.email,
    required this.name,
    required this.id,
  });

  final String email;
  final String name;
  final String id;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @override
  String toString() {
    return 'UserData{email: $email, name: $name, id: $id}';
  }
}
