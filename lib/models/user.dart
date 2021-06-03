import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.data,
  });

  Data data;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
