class MobileConfig {
  int id;
  String name;
  String description;
  String value;

  MobileConfig({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
  });

  factory MobileConfig.fromJson(Map<String, dynamic> json) {
    return MobileConfig(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      value: json['value'],
    );
  }
}
