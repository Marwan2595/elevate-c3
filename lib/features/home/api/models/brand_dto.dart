import 'package:json_annotation/json_annotation.dart';

part 'brand_dto.g.dart';

@JsonSerializable()
class BrandDTO {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;

  BrandDTO({this.Id, this.name, this.slug, this.image});

  factory BrandDTO.fromJson(Map<String, dynamic> json) {
    return _$BrandDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandDTOToJson(this);
  }
}
