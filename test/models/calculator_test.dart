import 'package:elevate_c3_sunday/features/home/domain/models/category_model.dart';
import 'package:elevate_c3_sunday/models/calculator.dart';
import 'package:test/test.dart';

void main() {
  late Calculator calculator;

  setUp(() {
    print(">>>>>>>>>>>>>>>>Setup<<<<<<<<<<<<<<<<<");
  });
  setUpAll(() {
    print(">>>>>>>>>>>>>>>>SetupAll<<<<<<<<<<<<<<<<<");
    calculator = Calculator();
  });
  tearDown(() {
    print(">>>>>>>>>>>>>>>>tearDown<<<<<<<<<<<<<<<<<");
  });
  tearDownAll(() {
    print(">>>>>>>>>>>>>>>>tearDownAll<<<<<<<<<<<<<<<<<");
  });
  ///////////////////ADD TESTS
  group("Add Function TESTS", () {
    test("Add two positive numbers 4+8=12", () {
      //Act
      int result = calculator.add(4, 8);

      //Assert
      //expect(ACTUAL Result, Expected result);
      expect(result, 12);
    });

    test("Add 2 negative numbers   -4 + -5  = -9", () {
      //Act
      int result = calculator.add(-4, -5);

      //Assert
      expect(result, isA<List<CategoryModel>>());
    });
  });

  //////////////////SUBTRACT TESTS
  group("Subtract Function TESTS", () {
    test("Subtract 2 positive numbers   8 - 4  = 4", () {
      //Act
      int result = calculator.subtract(8, 4);

      //Assert
      expect(result, 4);
    });
  });
  group("Divide Function TESTS", () {
    test("Divide By Zero should return 0", () {
      //Act
      double result = calculator.divide(8, 0);

      //Assert
      expect(result, 0);
    });
  });
}
