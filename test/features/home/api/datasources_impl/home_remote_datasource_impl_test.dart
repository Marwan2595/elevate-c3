import 'package:elevate_c3_sunday/config/api_result/api_result.dart';
import 'package:elevate_c3_sunday/features/home/api/client/home_api_client.dart';
import 'package:elevate_c3_sunday/features/home/api/datasources_impl/home_remote_datasource_impl.dart';
import 'package:elevate_c3_sunday/features/home/api/models/category_dto.dart';
import 'package:elevate_c3_sunday/features/home/api/models/response/categories_response.dart';
import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';

import 'home_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([HomeApiClient])
void main() {
  late MockHomeApiClient mockHomeApiClient;
  late HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;
  late List<CategoryDTO> mockCategoryDTOList;

  setUpAll(() {
    mockHomeApiClient = MockHomeApiClient();
    homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl(mockHomeApiClient);

    mockCategoryDTOList = [
      CategoryDTO(
        Id: "1",
        name: "Category 1",
        slug: "category-1",
        image: "https://example.com/category1.jpg",
      ),
      CategoryDTO(
        Id: "2",
        name: "Category 2",
        slug: "category-2",
        image: "https://example.com/category1.jpg",
      ),
    ];
  });

  group("Test getCategories Function in HomeRemoteDataSourceImpl", () {
    test('Success case for getCategories with list of categoryDTO', () async {
      //Arrange
      final mockCatResponse = CategoriesResponse(data: mockCategoryDTOList);
      when(
        mockHomeApiClient.getCategories(),
      ).thenAnswer((_) async => mockCatResponse);
      //Act
      final result = await homeRemoteDataSourceImpl.getCategories();

      //Assert
      expect(result, isA<ApiSuccessResult<List<CategoryModel>>>());
      ApiSuccessResult<List<CategoryModel>> successResult =
          result as ApiSuccessResult<List<CategoryModel>>;

      //check for first elemnt
      expect(successResult.data[0].name, mockCategoryDTOList[0].name);
      expect(successResult.data[0].imageUrl, mockCategoryDTOList[0].image);

      //check for second elemnt
      expect(successResult.data[1].name, mockCategoryDTOList[1].name);
      expect(successResult.data[1].imageUrl, mockCategoryDTOList[1].image);

      expect(successResult.data.length, equals(mockCategoryDTOList.length));

      verify(mockHomeApiClient.getCategories()).called(1);
    });
    test('Error case for getCategories with DioException', () async {
      //Arrange
      final String mockErrorMessage = "Something went wrong";
      final DioException mockDioException = DioException(
        requestOptions: RequestOptions(),
        message: mockErrorMessage,
      );
      when(mockHomeApiClient.getCategories()).thenThrow(mockDioException);

      //Act
      final result = await homeRemoteDataSourceImpl.getCategories();

      expect(result, isA<ApiErrorResult<List<CategoryModel>>>());
      final ApiErrorResult<List<CategoryModel>> errorResult =
          result as ApiErrorResult<List<CategoryModel>>;

      expect(errorResult.errorMessage, equals(mockErrorMessage));
      verify(mockHomeApiClient.getCategories()).called(1);
    });
  });
}
