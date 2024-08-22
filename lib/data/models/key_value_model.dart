import 'package:json_annotation/json_annotation.dart';

part 'key_value_model.g.dart';

@JsonSerializable()
class KeyValueModel {
  final String key;
  final String value;

  KeyValueModel({required this.key, required this.value});

  factory KeyValueModel.fromJson(Map<String, dynamic> json) =>
      _$KeyValueModelFromJson(json);
  Map<String, dynamic> toJson() => _$KeyValueModelToJson(this);
}
