import 'package:meals/Model/categories_model.dart';

import '../Helper/api.dart';

class GetAllCategoriesServices {
  Future<List<CategoriesModel>> getallcategories() async {
    Map<String, dynamic> data = await Api().get(
        url: "https://www.themealdb.com/api/json/v1/1/categories.php",
        token: '');

    List<CategoriesModel> catlist = [];

    for (var i = 0; i < data['categories'].length; i++) {
      catlist.add(CategoriesModel.fromJson(data['categories'][i]));
    }
    print(data);
    return catlist;
  }
}
