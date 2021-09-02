// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      poster: json['poster'] as String?,
      address: json['address'] == null
          ? null
          : HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      services: json['services'] == null
          ? null
          : HotelServices.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'price': instance.price,
      'rating': instance.rating,
      'address': instance.address?.toJson(),
      'services': instance.services?.toJson(),
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      coords: json['coords'] == null
          ? null
          : HotelAddressCoords.fromJson(json['coords'] as Map<String, dynamic>),
      city: json['city'] as String? ?? 'Не указано',
      country: json['country'] as String? ?? 'Не указано',
      street: json['street'] as String? ?? 'Не указано',
      zip_code: json['zip_code'] as int? ?? 0,
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'coords': instance.coords?.toJson(),
    };

HotelAddressCoords _$HotelAddressCoordsFromJson(Map<String, dynamic> json) =>
    HotelAddressCoords(
      lan: (json['lan'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HotelAddressCoordsToJson(HotelAddressCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) =>
    HotelServices(
      free: (json['free'] as List<dynamic>?)?.map((e) => e as String).toList(),
      paid: (json['paid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
