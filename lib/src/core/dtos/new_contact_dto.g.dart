// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewContactDTO _$NewContactDTOFromJson(Map<String, dynamic> json) =>
    NewContactDTO(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$NewContactDTOToJson(NewContactDTO instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
    };
