class CategoriesModel {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  CategoriesModel(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumb,
      required this.strCategoryDescription});

  factory CategoriesModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoriesModel(
      idCategory: jsonData['idCategory'],
      strCategory: jsonData['strCategory'],
      strCategoryThumb: jsonData['strCategoryThumb'],
      strCategoryDescription: jsonData['strCategoryDescription'],
    );
  }
}
