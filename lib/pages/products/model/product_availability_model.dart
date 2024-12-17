import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAvailabilityModel {
  final Map<String, dynamic> monday;
  final Map<String, dynamic> tuesday;
  final Map<String, dynamic> wednesday;
  final Map<String, dynamic> thursday;
  final Map<String, dynamic> friday;
  final Map<String, dynamic> saturday;
  final Map<String, dynamic> sunday;

  ProductAvailabilityModel({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  static ProductAvailabilityModel fromJson(
      Map<Map<String, dynamic>, int> json) {
    return ProductAvailabilityModel(
      monday: {},
      tuesday: {},
      wednesday: {},
      thursday: {},
      friday: {},
      saturday: {},
      sunday: {},
    );
  }

  factory ProductAvailabilityModel.fromSnapshot(
      QueryDocumentSnapshot document) {
    if (document.data() != null) {
      return ProductAvailabilityModel(
        monday: document['monday'],
        tuesday: document['tuesday'],
        wednesday: document['wednesday'],
        thursday: document['thursday'],
        friday: document['friday'],
        saturday: document['saturday'],
        sunday: document['sunday'],
      );
    } else {
      return ProductAvailabilityModel.empty;
    }
  }

  static ProductAvailabilityModel get empty => ProductAvailabilityModel(
        monday: {},
        tuesday: {},
        wednesday: {},
        thursday: {},
        friday: {},
        saturday: {},
        sunday: {},
      );

  Map<String, dynamic> toJson() {
    return {
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
    };
  }
}
