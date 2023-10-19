class CustomerTTH {
  String tthNo;
  String salesId;
  String custId;
  String docDate;
  int recived;
  String revivedDate;
  String failedReason;

  CustomerTTH({
    required this.tthNo,
    required this.salesId,
    required this.custId,
    required this.docDate,
    required this.recived,
    required this.revivedDate,
    required this.failedReason,
  });

  factory CustomerTTH.fromJson(Map<String, dynamic> json) {
    return CustomerTTH(
      tthNo: json['tthNo'],
      salesId: json['salesId'],
      custId: json['custId'],
      docDate: json['docDate'],
      recived: json['recived'],
      revivedDate: json['revivedDate'],
      failedReason: json['failedReason'],
    );
  }
}
