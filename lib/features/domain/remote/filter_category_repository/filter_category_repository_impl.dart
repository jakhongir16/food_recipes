part of 'filter_category_repository.dart';

class FilterCategoryRepositoryImpl implements FilterCategoryRepository {
  final Dio dio;
  FilterCategoryRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<FilterMeals>>> filterMealCategory(String categoryName) async {
    try{
      final response = await dio.get("${AppContants.baseUrl}${Urls.getCategoryFilterGood}$categoryName");

      if(response.statusCode == 200){
        List filterCategory = response.data["meals"];

        if(filterCategory.isEmpty){
          return const Right([]);
        } else {
          List<FilterMeals> filterMealCategory = filterCategory.
          map((e) => FilterMeals.fromJson(e))
          .toList();
          return Right(filterMealCategory);
        }
      } else {
        return Left(ServerError.withDioError(error: response.data).failure);
      }
    } on DioException catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}