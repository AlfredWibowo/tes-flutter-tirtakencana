class CustomerTTH {
  int id;
  String tthNo;
  String salesId;
  String ttoTTPNo;
  String custId;
  String docDate;
  int received;
  String receivedDate;
  String failedReason;

  CustomerTTH({
    required this.id,
    required this.tthNo,
    required this.salesId,
    required this.ttoTTPNo,
    required this.custId,
    required this.docDate,
    required this.received,
    required this.receivedDate,
    required this.failedReason,
  });

  factory CustomerTTH.fromJson(Map<String, dynamic> json) {
    return CustomerTTH(
      id: json['ID'],
      tthNo: json['TTHNo'],
      salesId: json['SalesID'],
      ttoTTPNo: json['TTOTTPNo'],
      custId: json['CustID'],
      docDate: json['DocDate'],
      received: json['Received'],
      receivedDate: json['ReceivedDate'],
      failedReason: json['FailedReason'],
    );
  }
}
