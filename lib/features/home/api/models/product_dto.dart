import 'package:elevate_c3_sunday/features/home/api/models/brand_dto.dart';
import 'package:elevate_c3_sunday/features/home/api/models/category_dto.dart';
import 'package:elevate_c3_sunday/features/home/api/models/sub_category_dto.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "subcategory")
  final List<SubcategoryDTO>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  final int? ratingsQuantity;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryDTO? category;
  @JsonKey(name: "brand")
  final BrandDTO? brand;
  @JsonKey(name: "ratingsAverage")
  final double? ratingsAverage;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "id")
  final String? id;

  ProductDTO({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.Id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return _$ProductDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDTOToJson(this);
  }

  ProductModel toProductModel() => ProductModel(
    ratingAvg: ratingsAverage ?? 0,
    name: title ?? '',
    imageUrl: imageCover ?? "",
    price: price ?? 0,
  );
}
