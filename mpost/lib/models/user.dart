/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String mobile;
  final String email;
  final String national_id_number;
  final String passport_number;
  final bool is_superuser;
  final String role_id;
  final String referred_by;
  final String referee_id;
  final String referral_code;
  final String mobile_verified_at;
  final String email_verified_at;
  final String created_at;
  final String updated_at;
  final String corporate_name;
  final String corporate_reg_no;
  final String user_type_id;
  final String country_id;
  final String agent_type_ref;
  final String parent_ref;
  final String full_name;
  final String referrals_count;
  User({
    required this.id,
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.mobile,
    required this.email,
    required this.national_id_number,
    required this.passport_number,
    required this.is_superuser,
    required this.role_id,
    required this.referred_by,
    required this.referee_id,
    required this.referral_code,
    required this.mobile_verified_at,
    required this.email_verified_at,
    required this.created_at,
    required this.updated_at,
    required this.corporate_name,
    required this.corporate_reg_no,
    required this.user_type_id,
    required this.country_id,
    required this.agent_type_ref,
    required this.parent_ref,
    required this.full_name,
    required this.referrals_count,
  });

  

  User copyWith({
    String? id,
    String? first_name,
    String? middle_name,
    String? last_name,
    String? mobile,
    String? email,
    String? national_id_number,
    String? passport_number,
    bool? is_superuser,
    String? role_id,
    String? referred_by,
    String? referee_id,
    String? referral_code,
    String? mobile_verified_at,
    String? email_verified_at,
    String? created_at,
    String? updated_at,
    String? corporate_name,
    String? corporate_reg_no,
    String? user_type_id,
    String? country_id,
    String? agent_type_ref,
    String? parent_ref,
    String? full_name,
    String? referrals_count,
  }) {
    return User(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      middle_name: middle_name ?? this.middle_name,
      last_name: last_name ?? this.last_name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      national_id_number: national_id_number ?? this.national_id_number,
      passport_number: passport_number ?? this.passport_number,
      is_superuser: is_superuser ?? this.is_superuser,
      role_id: role_id ?? this.role_id,
      referred_by: referred_by ?? this.referred_by,
      referee_id: referee_id ?? this.referee_id,
      referral_code: referral_code ?? this.referral_code,
      mobile_verified_at: mobile_verified_at ?? this.mobile_verified_at,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      corporate_name: corporate_name ?? this.corporate_name,
      corporate_reg_no: corporate_reg_no ?? this.corporate_reg_no,
      user_type_id: user_type_id ?? this.user_type_id,
      country_id: country_id ?? this.country_id,
      agent_type_ref: agent_type_ref ?? this.agent_type_ref,
      parent_ref: parent_ref ?? this.parent_ref,
      full_name: full_name ?? this.full_name,
      referrals_count: referrals_count ?? this.referrals_count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'middle_name': middle_name,
      'last_name': last_name,
      'mobile': mobile,
      'email': email,
      'national_id_number': national_id_number,
      'passport_number': passport_number,
      'is_superuser': is_superuser,
      'role_id': role_id,
      'referred_by': referred_by,
      'referee_id': referee_id,
      'referral_code': referral_code,
      'mobile_verified_at': mobile_verified_at,
      'email_verified_at': email_verified_at,
      'created_at': created_at,
      'updated_at': updated_at,
      'corporate_name': corporate_name,
      'corporate_reg_no': corporate_reg_no,
      'user_type_id': user_type_id,
      'country_id': country_id,
      'agent_type_ref': agent_type_ref,
      'parent_ref': parent_ref,
      'full_name': full_name,
      'referrals_count': referrals_count,
    };
  }

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      id: map['id'] .toString(),
      first_name: map['first_name'] .toString(),
      middle_name: map['middle_name'] .toString(),
      last_name: map['last_name'] .toString(),
      mobile: map['mobile'] .toString(),
      email: map['email'] .toString(),
      national_id_number: map['national_id_number'] .toString(),
      passport_number: map['passport_number'] .toString(),
      is_superuser: map['is_superuser'] as bool,
      role_id: map['role_id'].toString(),
      referred_by: map['referred_by'] .toString(),
      referee_id: map['referee_id'] .toString(),
      referral_code: map['referral_code'] .toString(),
      mobile_verified_at: map['mobile_verified_at'] .toString(),
      email_verified_at: map['email_verified_at'] .toString(),
      created_at: map['created_at'] .toString(),
      updated_at: map['updated_at'] .toString(),
      corporate_name: map['corporate_name'] .toString(),
      corporate_reg_no: map['corporate_reg_no'] .toString(),
      user_type_id: map['user_type_id'] .toString(),
      country_id: map['country_id'] .toString(),
      agent_type_ref: map['agent_type_ref'] .toString(),
      parent_ref: map['parent_ref'] .toString(),
      full_name: map['full_name'] .toString(),
      referrals_count: map['referrals_count'] .toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, first_name: $first_name, middle_name: $middle_name, last_name: $last_name, mobile: $mobile, email: $email, national_id_number: $national_id_number, passport_number: $passport_number, is_superuser: $is_superuser, role_id: $role_id, referred_by: $referred_by, referee_id: $referee_id, referral_code: $referral_code, mobile_verified_at: $mobile_verified_at, email_verified_at: $email_verified_at, created_at: $created_at, updated_at: $updated_at, corporate_name: $corporate_name, corporate_reg_no: $corporate_reg_no, user_type_id: $user_type_id, country_id: $country_id, agent_type_ref: $agent_type_ref, parent_ref: $parent_ref, full_name: $full_name, referrals_count: $referrals_count)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.middle_name == middle_name &&
      other.last_name == last_name &&
      other.mobile == mobile &&
      other.email == email &&
      other.national_id_number == national_id_number &&
      other.passport_number == passport_number &&
      other.is_superuser == is_superuser &&
      other.role_id == role_id &&
      other.referred_by == referred_by &&
      other.referee_id == referee_id &&
      other.referral_code == referral_code &&
      other.mobile_verified_at == mobile_verified_at &&
      other.email_verified_at == email_verified_at &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.corporate_name == corporate_name &&
      other.corporate_reg_no == corporate_reg_no &&
      other.user_type_id == user_type_id &&
      other.country_id == country_id &&
      other.agent_type_ref == agent_type_ref &&
      other.parent_ref == parent_ref &&
      other.full_name == full_name &&
      other.referrals_count == referrals_count;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      middle_name.hashCode ^
      last_name.hashCode ^
      mobile.hashCode ^
      email.hashCode ^
      national_id_number.hashCode ^
      passport_number.hashCode ^
      is_superuser.hashCode ^
      role_id.hashCode ^
      referred_by.hashCode ^
      referee_id.hashCode ^
      referral_code.hashCode ^
      mobile_verified_at.hashCode ^
      email_verified_at.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      corporate_name.hashCode ^
      corporate_reg_no.hashCode ^
      user_type_id.hashCode ^
      country_id.hashCode ^
      agent_type_ref.hashCode ^
      parent_ref.hashCode ^
      full_name.hashCode ^
      referrals_count.hashCode;
  }
}
