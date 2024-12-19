import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleModel {
  final String model;
  final String? id;
  final String company;
  final String registrationNumber;
  final String color;
  final String photoUrl;
  final String description;
  final String type;

  VehicleModel({
    this.id,
    required this.model,
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
      company: document['company'],
      registrationNumber: document['registrationNumber'],
      color: document['color'],
      photoUrl: document['photoUrl'],
      description: document['description'],
    );
  }

  static VehicleModel get empty => VehicleModel(
        model: '',
        type: '',
        company: '',
        registrationNumber: '',
        color: '',
        photoUrl: '',
        description: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'company': company,
      'registrationNumber': registrationNumber,
      'color': color,
      'photoUrl': photoUrl,
      'description': description,
      'type': type,
    };
  }

  VehicleModel copyWith(
      {String? model,
      String? company,
      String? registrationNumber,
      String? color,
      String? photoUrl,
      String? description,
      String? type}) {
    return VehicleModel(
      type: type ?? this.type,
      model: model ?? this.model,
      company: company ?? this.company,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      color: color ?? this.color,
      photoUrl: photoUrl ?? this.photoUrl,
      description: description ?? this.description,
    );
  }
}
