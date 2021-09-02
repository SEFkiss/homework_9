// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelShortInfo _$HotelShortInfoFromJson(Map<String, dynamic> json) =>
    HotelShortInfo(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      poster: json['poster'] as String?,
    );

Map<String, dynamic> _$HotelShortInfoToJson(HotelShortInfo instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };
