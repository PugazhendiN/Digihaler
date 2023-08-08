// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as int,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      bloodGroup: json['blood_group'] as String?,
      phoneNumber: json['phone_number'] as String,
      facebookUrl: json['facebook_url'] as String?,
      twitterUrl: json['twitter_url'] as String?,
      linkedinUrl: json['linkedin_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'height': instance.height,
      'weight': instance.weight,
      'blood_group': instance.bloodGroup,
      'phone_number': instance.phoneNumber,
      'facebook_url': instance.facebookUrl,
      'twitter_url': instance.twitterUrl,
      'linkedin_url': instance.linkedinUrl,
      'instagram_url': instance.instagramUrl,
    };
