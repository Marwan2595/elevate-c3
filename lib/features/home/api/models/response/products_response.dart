import 'package:elevate_c3_sunday/features/home/api/models/metadata_dto.dart';
import 'package:elevate_c3_sunday/features/home/api/models/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDTO? metadata;
  @JsonKey(name: "data")
  final List<ProductDTO>? data;

  ProductsResponse({this.results, this.metadata, this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseToJson(this);
  }
}
