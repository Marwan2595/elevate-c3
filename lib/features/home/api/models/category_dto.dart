import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDTO {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;

  CategoryDTO({this.Id, this.name, this.slug, this.image});

  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return _$CategoryDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryDTOToJson(this);
  }

  CategoryModel toCategoryModel() =>
      CategoryModel(imageUrl: image ?? "", name: name ?? "");
}
