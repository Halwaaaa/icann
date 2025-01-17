class ProdectModels {
  final int id;
  final String name;
  final dynamic price;

  ProdectModels({
    required this.id,
    required this.name,
    required this.price,
  });

  // لتحويل JSON إلى كائن
  factory ProdectModels.fromJson(Map<String, dynamic> json) {
    return ProdectModels(
      name: json['name'],
      id: json['id'],
      price: json['price'],
    );
  }

  // لتحويل كائن إلى JSON
}
