class CustomerTTHDetail {
  int id;
  String tthNo;
  String ttoTTPNo;
  String jenis;
  int qty;
  String unit;

  CustomerTTHDetail({
    required this.id,
    required this.tthNo,
    required this.ttoTTPNo,
    required this.jenis,
    required this.qty,
    required this.unit,
  });

  factory CustomerTTHDetail.fromJson(Map<String, dynamic> json) {
    return CustomerTTHDetail(
      id: json['ID'],
      tthNo: json['TTHNo'],
      ttoTTPNo: json['TTOTTPNo'],
      jenis: json['Jenis'],
      qty: json['Qty'],
      unit: json['Unit'],
    );
  }
}
