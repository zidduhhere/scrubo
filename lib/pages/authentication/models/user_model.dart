import 'package:cloud_firestore/cloud_firestore.dart';

///UserModel class is used to store the user data and pass the data to the database.
///The UserModel class has the following properties:
///Parameters:
///`uid` (String): The unique id of the user.
///`email` (String): The email of the user.
///`firstName` (String): The first name of the user.
///`lastName` (String): The last name of the user.
///`phoneNumber` (String): The phone number of the user.
///`photoUrl` (String): The photo url of the user.
class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? username;
  String? phoneNumber;
  String? photoUrl;

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.photoUrl,
      required this.username});

  ///Gets the complete name of the user.
  String get fullName => '$firstName $lastName';

  String get getUid => uid!;

  ///Converts the Map object to UserModel object.
  ///Parameters:
  ///`json` (Map<String, dynamic>): The map object of the UserModel.
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'],
      email: json['Email'],
      firstName: json['First Name'],
      lastName: json['Last Name'],
      phoneNumber: json['Phone Number'],
      photoUrl: json['Photo'],
      username: json['Username'],
    );
  }

  static UserModel fromFirebaseDataSnapshot(DocumentSnapshot document) {
    if (document.data() != null) {
      return UserModel(
        uid: document.id,
        email: document['Email'] ?? '',
        firstName: document['First Name'] ?? '',
        lastName: document['Last Name'] ?? '',
        phoneNumber: document['Phone Number'] ?? '',
        photoUrl: document['Photo'] ?? '',
        username: document['Username'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  ///Converts the UserModel object to a Map object.
  ///Returns:
  ///Map<String, dynamic>: The map object of the UserModel.
  ///The map object contains the following key-value pairs:
  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'Email': email,
      'First Name': firstName,
      'Last Name': lastName,
      'Phone Number': phoneNumber,
      'Photo': photoUrl,
      'Username': username,
    };
  }

  ///Empty UserModel object.
  ///Returns:
  ///UserModel: The empty UserModel object.
  static UserModel empty() => UserModel(
        uid: '',
        email: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        username: '',
        photoUrl: '',
      );
}
