import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scrubo/pages/products/model/product_addons_model.dart';
import 'package:scrubo/pages/products/model/product_availability_model.dart';
import 'package:scrubo/pages/products/model/product_variations.dart';

/// This model contains information about products including:
/// * product identification details
/// * pricing information
/// * stock and inventory details
/// * product status and metadata
///
/// {@tool snippet}
/// ```dart
/// final product = ProductModel(
///   id: '123',
///   name: 'Example Product',
///   price: 99.99,
///   // ... other parameters
/// );
/// ```
/// {@end-tool}
///
/// Parameters:
/// * [id] - Unique identifier for the product
/// * [name] - Name of the product
/// * [description] - Detailed description of the product
/// * [thumbnail] - URL or path to the product's main image
/// * [price] - Current price of the product
/// * [addons] - Addons gives the list of products that is selled with the service for extra cash
/// * [category] - Category classification of the product
/// * [shopName] - Brand name or shop of the product
/// * [forCarOnly] - Gives the nature of the service
/// * [isFeatured] - Checks if the product is featured product
/// * [rating] - Average customer rating
/// * [comments] - Gives customer feedback and reviews
/// * [countOfReviews] - Gives the count of reviews of the product
/// * [status] - Checks if the slot of the product is avaialble
/// * [timeTaken] - Time taken for the service to complete in minutes
/// * [varitaions] - Different types of product showcased using ProductVaritaions Model
class ProductModel {
  final String id;
  final String name;
  final List<ProductAddons> addons;
  final ProductAvailabilityModel availability;
  final int category;
  final String description;
  final bool forCarOnly;
  final bool isFeatured;
  final List<String> photoUrls;
  final Map<String, dynamic> ratings;
  final List<dynamic> comments;
  final int countOfReviews;
  final String shopName;
  final bool status;
  final String thumbnail;
  final double timeTaken;
  final List<ProductVariations> varitaions;

  ProductModel({
    required this.id,
    required this.name,
    required this.addons,
    required this.availability,
    required this.category,
    required this.description,
    required this.forCarOnly,
    required this.isFeatured,
    required this.photoUrls,
    required this.ratings,
    required this.comments,
    required this.countOfReviews,
    required this.shopName,
    required this.status,
    required this.thumbnail,
    required this.timeTaken,
    required this.varitaions,
  });

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      addons: json['addons'],
      availability: json['availability'],
      category: json['category'],
      description: json['description'],
      forCarOnly: json['forCarOnly'],
      isFeatured: json['isFeatured'],
      photoUrls: json['photoUrls'],
      ratings: json['ratings'],
      comments: json['comments'],
      countOfReviews: json['countOfReviews'],
      shopName: json['shopName'],
      status: json['status'],
      thumbnail: json['thumbnail'],
      timeTaken: json['timeTaken'],
      varitaions: json['varitaions'],
    );
  }

  static ProductModel get empty => ProductModel(
        id: '',
        name: '',
        addons: [],
        availability: ProductAvailabilityModel.empty,
        category: 0,
        description: '',
        forCarOnly: false,
        isFeatured: false,
        photoUrls: [],
        ratings: {},
        comments: [],
        countOfReviews: 0,
        shopName: '',
        status: false,
        thumbnail: '',
        timeTaken: 0.0,
        varitaions: [],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'addons': addons.map((element) => element.toJson()).toList(),
      'availability': availability.toJson(),
      'category': category,
      'description': description,
      'forCarOnly': forCarOnly,
      'isFeatured': isFeatured,
      'photoUrls': List<String>.from(photoUrls),
      'ratings': ratings,
      'comments': comments,
      'countOfReviews': countOfReviews,
      'shopName': shopName,
      'status': status,
      'thumbnail': thumbnail,
      'timeTaken': timeTaken,
      'varitaions': varitaions.map((element) => element.toJson()).toList(),
    };
  }

  static int getPreviousPrice(double price) {
    return (price * 1.1).toInt();
  }

  static ProductModel fromSnapshot(QueryDocumentSnapshot document) {
    if (document.data() != null) {
      final listOfVariation = document['variations'] as List;
      List<ProductVariations> variations =
          listOfVariation.map((e) => ProductVariations.fromJson(e)).toList();

      return ProductModel(
        id: document.id,
        name: document['name'],
        addons: ProductAddons.fromSnapshot(document['addons']),
        availability: ProductAvailabilityModel.empty,
        category: document['category'],
        description: document['description'],
        forCarOnly: document['forCarOnly'],
        isFeatured: document['isFeatured'],
        photoUrls: List<String>.from(document['photoUrls']),
        ratings: document['ratings'],
        comments: document['comments'],
        countOfReviews: document['countOfReviews'],
        shopName: document['shopName'],
        status: document['status'],
        thumbnail: document['thumbnail'],
        timeTaken: document['timeTaken'],
        varitaions: variations,
      );
    } else {
      return ProductModel.empty;
    }
  }
}
