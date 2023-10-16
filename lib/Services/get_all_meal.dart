import 'package:meals/Model/meals_model.dart';

import '../Helper/api.dart';

class GetAllMeals {
  Future<List<MealModel>> getallmeals({required String categories}) async {
    Map<String, dynamic> data = await Api().get(
        url: "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categories",
        token: '');

    List<MealModel> mealList = [];

    if (data['meals'] != null) {
      for (var i = 0; i < data['meals'].length; i++) {
        mealList.add(MealModel.fromJson(data['meals'][i]));
      }
    }
    return mealList;
  }
}
