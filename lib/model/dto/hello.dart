import 'package:json_annotation/json_annotation.dart';

part 'hello.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Hello {
  final String hello;

  Hello({required this.hello});

  factory Hello.fromJson(Map<String, dynamic> json) =>
      _$HelloFromJson(json);

  Map<String, dynamic> toJson() => _$HelloToJson(this);
}
