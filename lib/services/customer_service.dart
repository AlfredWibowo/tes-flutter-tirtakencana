import 'dart:convert';

// import 'package:test_flutter_tirtakencana/models/customer_old.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_tirtakencana/models/customer.dart';

class CustomerService {
  Future<List<Customer>> getCustomers() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/customer'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((data) => Customer.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  Future<bool> updateCustomer(
      Customer customer, int received, String failedReason) async {
    final body = {
      "Received": received.toString(),
      "ReceivedDate": DateTime.now().toString(),
      "FailedReason": failedReason
    };

    final response = await http.put(
      Uri.parse('http://localhost:8000/api/customer/${customer.custId}'),
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update customers');
    }
  }
}
