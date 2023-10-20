import 'package:test_flutter_tirtakencana/models/customer_tth_detail.dart';

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
  CustomerTTHDetail customerTTHDetail;

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
    required this.customerTTHDetail,
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
      customerTTHDetail: CustomerTTHDetail.fromJson(json['CustomerTTHDetail']),
    );
  }
}
