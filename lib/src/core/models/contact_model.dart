import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ContactModel {
  ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.email,
    this.avatarUrl,
  });

  final int id;
  final String firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String? avatarUrl;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);

  ContactModel copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? avatarUrl,
  }) {
    return ContactModel(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
