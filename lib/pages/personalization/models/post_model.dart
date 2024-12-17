class PostModel {
  final String city;
  final String country;
  final String state;
  final String name;

  PostModel({
    required this.city,
    required this.country,
    required this.state,
    required this.name,
  });

  static fromJson(Map<String, dynamic> json) {
    return PostModel(
      city: json['District'],
      country: json['Country'],
      state: json['State'],
      name: json['Block'],
    );
  }

  static PostModel get empty => PostModel(
        city: '',
        country: '',
        state: '',
        name: '',
      );
}
