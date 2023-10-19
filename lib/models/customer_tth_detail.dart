class CustomerTTHDetail {
  int id;
  String tthNo;
  String jenis;
  String qty;
  String unit;

  CustomerTTHDetail({
    required this.id,
    required this.tthNo,
    required this.jenis,
    required this.qty,
    required this.unit,
  });

  factory CustomerTTHDetail.fromJson(Map<String, dynamic> json) {
    return CustomerTTHDetail(
      id: json['id'],
      tthNo: json['tthNo'],
      jenis: json['jenis'],
      qty: json['qty'],
      unit: json['unit'],
    );
  }
}
