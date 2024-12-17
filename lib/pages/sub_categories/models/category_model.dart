import 'package:cloud_firestore/cloud_firestore.dart';

/// CategoryModel class
/// This class is used to store the category data
/// and pass the data to the database.
/// The CategoryModel class has the following properties:
/// Parameters:
///
/// `id` (String): The unique id of the category.
///
/// `name` (String): The name of the category.
///
/// `image` (String): The image of the category.
///
/// `isFeatured` (bool): The boolean value to determine if the category is featured.
///
/// `parentId` (String): The parent id of the category.
///
/// `empty` (CategoryModel): The empty CategoryModel object.
class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  final String id;
  final String name;
  String image;
  final bool isFeatured;
  final String parentId;

  //Empty CategoryModel
  static CategoryModel get empty =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  ///Converts the Map object to CategoryModel object.
  ///Parameters:
  ///`json` (Map<String, dynamic>): The map object of the CategoryModel.
  ///
  ///Returns: CategoryModel
  ///
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data != null) {
      return CategoryModel(
        id: snapshot.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        parentId: data['parentId'] ?? '',
      );
    }
    return CategoryModel.empty;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "isFeatured": isFeatured,
      "parentId": parentId
    };
  }
}
