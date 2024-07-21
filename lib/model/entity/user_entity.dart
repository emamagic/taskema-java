// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserEntity {
  String id;
  String name;
  String password;
  UserEntity({
    required this.id,
    required this.name,
    required this.password,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? password,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserEntity(id: $id, name: $name, password: $password)';

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode;
}
