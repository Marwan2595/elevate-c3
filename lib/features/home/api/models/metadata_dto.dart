import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDTO {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "nextPage")
  final int? nextPage;

  MetadataDTO({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory MetadataDTO.fromJson(Map<String, dynamic> json) {
    return _$MetadataDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDTOToJson(this);
  }
}
