class ProdectModels {
  final int id;
  final String name;
  final dynamic price;
  final dynamic count;

  ProdectModels(
      {required this.id,
      required this.name,
      required this.count,
      required this.price});

  // لتحويل JSON إلى كائن
  factory ProdectModels.fromJson(Map<String, dynamic> json) {
    return ProdectModels(
      name: json['name'],
      id: json['id'],
      price: json['price'],
      count: json['count'],
    );
  }

  // لتحويل كائن إلى JSON
}
