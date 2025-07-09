import 'package:elevate_c3_sunday/features/home/api/models/category_dto.dart';
import 'package:elevate_c3_sunday/features/home/api/models/metadata_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final int? results;
  final MetadataDTO? metadata;
  final List<CategoryDTO>? data;

  CategoriesResponse({this.results, this.metadata, this.data});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
