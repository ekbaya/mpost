/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
import 'dart:convert';

class Status {
  final int id;
  final String name;
  final String color_code;
  final String description;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  Status({
    required this.id,
    required this.name,
    required this.color_code,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Status copyWith({
    int? id,
    String? name,
    String? color_code,
    String? description,
    String? created_at,
    String? updated_at,
    String? deleted_at,
  }) {
    return Status(
      id: id ?? this.id,
      name: name ?? this.name,
      color_code: color_code ?? this.color_code,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color_code': color_code,
      'description': description,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  factory Status.fromMap(Map<dynamic, dynamic> map) {
    return Status(
      id: map['id'] as int,
      name: map['name'] as String,
      color_code: map['color_code'] as String,
      description: map['description'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      deleted_at: map['deleted_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) => Status.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Status(id: $id, name: $name, color_code: $color_code, description: $description, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(covariant Status other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.color_code == color_code &&
      other.description == description &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.deleted_at == deleted_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      color_code.hashCode ^
      description.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      deleted_at.hashCode;
  }
}