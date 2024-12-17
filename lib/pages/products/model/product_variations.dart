class ProductVariations {
  String name;
  int price;
  String description;

  ProductVariations({
    required this.name,
    required this.price,
    required this.description,
  });

  static ProductVariations fromJson(Map<String, dynamic> json) {
    return ProductVariations(
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }

  List<ProductVariations> fromSnapshot(List<dynamic> documents) {
    if (documents.isNotEmpty) {
      final List<ProductVariations> variations = documents
          .map((e) =>
              ProductVariations.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return variations;
    }
    return [ProductVariations.empty];
  }

  static ProductVariations get empty => ProductVariations(
        name: '',
        price: 0,
        description: '',
      );
}
