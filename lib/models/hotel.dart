import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class Hotel {
  final String? uuid;
  final String? name;
  final String? poster;
  final double? price;
  final double? rating;
  final HotelAddress? address;
  final HotelServices? services;
  final List<String>? photos;

  Hotel({this.uuid, this.name, this.poster, this.address, this.photos, this.price, this.rating, this.services});
  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddress {
  @JsonKey(defaultValue: 'Не указано')
  final String? country;
  @JsonKey(defaultValue: 'Не указано')
  final String? street;
  @JsonKey(defaultValue: 'Не указано')
  final String? city;
  @JsonKey(defaultValue: 0)
  final int? zip_code;
  final HotelAddressCoords? coords;

  HotelAddress({this.coords, this.city, this.country, this.street, this.zip_code});
  factory HotelAddress.fromJson(Map<String, dynamic> json) => _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddressCoords {
  final double? lat;
  final double? lan;

  HotelAddressCoords({this.lan, this.lat});

  factory HotelAddressCoords.fromJson(Map<String, dynamic> json) => _$HotelAddressCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressCoordsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelServices {
  List<String>? free;
  List<String>? paid;

  HotelServices({this.free, this.paid});

  factory HotelServices.fromJson(Map<String, dynamic> json) => _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}

