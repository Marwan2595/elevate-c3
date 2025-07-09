// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandDTO _$BrandDTOFromJson(Map<String, dynamic> json) => BrandDTO(
  Id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$BrandDTOToJson(BrandDTO instance) => <String, dynamic>{
  '_id': instance.Id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};
