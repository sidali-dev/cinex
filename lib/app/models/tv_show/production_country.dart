class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({
    this.iso31661,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory ProductionCountry.fromJson(Map<String, dynamic> map) {
    return ProductionCountry(
      iso31661: map['iso31661'] as String?,
      name: map['name'] as String?,
    );
  }
}
