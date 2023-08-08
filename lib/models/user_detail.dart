import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable()
class UserDetail {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'height')
  double? height;

  @JsonKey(name: 'weight')
  double? weight;

  @JsonKey(name: 'blood_group')
  String? bloodGroup;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'facebook_url')
  String? facebookUrl;

  @JsonKey(name: 'twitter_url')
  String? twitterUrl;

  @JsonKey(name: 'linkedin_url')
  String? linkedinUrl;

  @JsonKey(name: 'instagram_url')
  String? instagramUrl;

  UserDetail({
    required this.name,
    required this.email,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.phoneNumber,
    required this.facebookUrl,
    required this.twitterUrl,
    required this.linkedinUrl,
    required this.instagramUrl,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
