part of 'search_meal_repository.dart';

class SearchMealRepositoryImpl implements SearchMealRepository {
  final Dio dio;

  SearchMealRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<FilterMeals>>> searchMeal(String meal) async {

   try{
     final response = await dio.get("${AppContants.baseUrl}${Urls.searchFood}$meal");

     if(response.statusCode == 200){
       List? allMeal = response.data["meals"];

       if(allMeal == null || allMeal.isEmpty){
         return const Right([]);
       } else {
         List<FilterMeals> allFilterMeals = allMeal.map((e) => FilterMeals.fromJson(e))
            .toList();

         return Right(allFilterMeals);
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