import 'package:meals/Helper/api.dart';
import 'package:meals/Model/detalies_model.dart';

class GetDetalies {
Future <DetaliesModel> getAllDetalies ({required String? id}) async{ 
  Map<String , dynamic> data = await Api().get(url: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id", token: '');
     DetaliesModel detailsModel = DetaliesModel.fromJson(data['meals'][0]) ;

  return detailsModel;
  
}


}