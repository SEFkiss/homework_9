import 'package:json_annotation/json_annotation.dart';

part 'hotels.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelShortInfo {
  final String? uuid;
  final String? name;
  final String? poster;

  HotelShortInfo({this.uuid, this.name, this.poster});

  factory HotelShortInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelShortInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelShortInfoToJson(this);
}
