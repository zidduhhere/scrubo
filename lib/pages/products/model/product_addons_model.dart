class ProductAddons {
  String description;
  String name;
  int price;
  int quanitity;

  ProductAddons({
    required this.description,
    required this.name,
    required this.price,
    required this.quanitity,
  });

  static ProductAddons fromJson(Map<String, dynamic> json) {
    return ProductAddons(
      description: json['description'],
      name: json['name'],
      price: json['price'],
      quanitity: json['quanitity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'name': name,
      'price': price,
      'quanitity': quanitity,
    };
  }

  static List<ProductAddons> fromSnapshot(List<dynamic> document) {
    if (document.isNotEmpty) {
      final List<ProductAddons> addons = document
          .map((e) => ProductAddons.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return addons;
    }
    return [ProductAddons.empty];
  }

  static ProductAddons get empty => ProductAddons(
        description: '',
        name: '',
        price: 0,
        quanitity: 0,
      );
}
