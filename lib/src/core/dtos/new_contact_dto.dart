import 'package:json_annotation/json_annotation.dart';

part 'new_contact_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewContactDTO {
  NewContactDTO({
    required this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.avatarUrl,
  });

  final String firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String? avatarUrl;

  factory NewContactDTO.fromJson(Map<String, dynamic> json) =>
      _$NewContactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$NewContactDTOToJson(this);
}
