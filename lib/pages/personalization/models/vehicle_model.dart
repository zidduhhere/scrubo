import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleModel {
  final String id;
  final String model;
  final String make;
  final String company;
  final String registrationNumber;
  final String color;
  final String photoUrl;
  final String description;
  final String type;

  VehicleModel({
    required this.id,
    required this.model,
    required this.make,
    required this.company,
    required this.registrationNumber,
    required this.color,
    required this.photoUrl,
    required this.description,
    required this.type,
  });

  static VehicleModel fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    return VehicleModel(
      id: document.id,
      type: document['type'],
      model: document['model'],
      make: document['make'],
      company: document['company'],
      registrationNumber: document['registrationNumber'],
      color: document['color'],
      photoUrl: document['photoUrl'],
      description: document['description'],
    );
  }

  static VehicleModel get empty => VehicleModel(
        id: '',
        model: '',
        make: '',
        type: '',
        company: '',
        registrationNumber: '',
        color: '',
        photoUrl: '',
        description: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'make': make,
      'company': company,
      'registrationNumber': registrationNumber,
      'color': color,
      'photoUrl': photoUrl,
      'description': description,
      'type': type,
    };
  }

  VehicleModel copyWith(
      {String? id,
      String? model,
      String? make,
      String? company,
      String? registrationNumber,
      String? color,
      String? photoUrl,
      String? description,
      String? type}) {
    return VehicleModel(
      type: type ?? this.type,
      id: id ?? this.id,
      model: model ?? this.model,
      make: make ?? this.make,
      company: company ?? this.company,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      color: color ?? this.color,
      photoUrl: photoUrl ?? this.photoUrl,
      description: description ?? this.description,
    );
  }
}
