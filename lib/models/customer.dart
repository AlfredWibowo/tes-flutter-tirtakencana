import 'package:test_flutter_tirtakencana/models/customer_tth.dart';

class Customer {
  String custId;
  String name;
  String address;
  String branchCode;
  String phoneNo;
  List<CustomerTTH> customerTTHs;

  Customer({
    required this.custId,
    required this.name,
    required this.address,
    required this.branchCode,
    required this.phoneNo,
    required this.customerTTHs,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json['CustomerTTHs'];
    List<CustomerTTH> customerTTHs =
        temp.map((e) => CustomerTTH.fromJson(e)).toList();

    return Customer(
      custId: json['CustID'],
      name: json['Name'],
      address: json['Address'],
      branchCode: json['BranchCode'],
      phoneNo: json['PhoneNo'],
      customerTTHs: customerTTHs,
    );
  }
}
