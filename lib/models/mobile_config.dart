class MobileConfig {
  int id;
  String branchCode;
  String name;
  String description;
  String value;

  MobileConfig({
    required this.id,
    required this.branchCode,
    required this.name,
    required this.description,
    required this.value,
  });

  factory MobileConfig.fromJson(Map<String, dynamic> json) {
    return MobileConfig(
      id: json['ID'],
      branchCode: json['BranchCode'],
      name: json['Name'],
      description: json['Description'],
      value: json['Value'],
    );
  }
}
